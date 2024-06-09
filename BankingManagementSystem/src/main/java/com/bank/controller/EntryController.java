package com.bank.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.QuoteMode;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bank.model.TransactionDetails;
import com.bank.model.User1;
import com.bank.service.TransactionService;
import com.bank.service.UserService;

@RestController
public class EntryController {
	@Autowired
	UserService userservice;

	@Autowired
	TransactionService transaction;

	static User1 userinfo;

	@RequestMapping("/")
	public ModelAndView entryRequest(Model model) {
		System.out.println("////");
		return new ModelAndView("Home");
	}

	@RequestMapping("/login")
	public ModelAndView loginPage(Model model) {

		return new ModelAndView("Home");
	}

	@RequestMapping("/accountinfo")
	public ModelAndView accountinfo(Model model) {

		model.addAttribute("userstatus", "accountinformation");
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");
	}

	@RequestMapping("/checkbalance")
	public ModelAndView checkBalance(Model model) {
		System.out.println("inside checkbalance------------>");
		model.addAttribute("userstatus", "accountbalance");
		model.addAttribute("user", userinfo);
		return new ModelAndView("User");

	}

	@RequestMapping("/transfermoney")
	public ModelAndView moneyTransfer(Model model) {
		model.addAttribute("userstatus", "moneytransfer");
		model.addAttribute("user", userinfo);

		List<User1> listofuser = userservice.findAll();
		model.addAttribute("listofuser", listofuser);

		return new ModelAndView("User");
	}

	@RequestMapping("/transactiondetails")
	public ModelAndView transactionDetails(Model model) {

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("user", userinfo);
//		List<TransactionDetails> listoftrans=transaction.getAllTransactionById(userinfo.getId());
//	//
//		
//		
//		List<TransactionDetails> listofcredit=transaction.getAllDetailsByCredit(userinfo.getAcno());

//		
//		List<TransactionDetails> listoftrans = transaction.getAllTRansaction(userinfo.getId(), userinfo.getAcno());
//		System.out.println(userinfo.getId());
//		System.out.println(userinfo.getAcno());
//
//		Iterator<TransactionDetails> iterator = listoftrans.iterator();
//
//		while (iterator.hasNext()) {
//			TransactionDetails trans = iterator.next();
//			System.out.println("name=" + trans.getReciename());
//			System.out.println("name=" + trans.getRecieamount());
//			System.out.println("time " + trans.getTransferdatetime());
//
//		}
//
//
//		model.addAttribute("transactiondetails", listoftrans);
//
//		model.addAttribute("accnom", userinfo.getAcno());
//		model.addAttribute("userid", userinfo.getId());
		return new ModelAndView("User");

//		// Create the Excel workbook and sheet
//		Workbook workbook = new XSSFWorkbook();
//		Sheet sheet = workbook.createSheet("Transactions");
//
//		// Create the header row
//		Row headerRow = sheet.createRow(0);
//		headerRow.createCell(0).setCellValue("Name");
//		headerRow.createCell(1).setCellValue("Amount");
//		headerRow.createCell(2).setCellValue("Time");
//
//		// Populate the sheet with data
//		int rowIndex = 1;
//		while (iterator.hasNext()) {
//			Row row = sheet.createRow(rowIndex++);
//			TransactionDetails trans = iterator.next();
//			row.createCell(0).setCellValue(trans.getReciename());
//			row.createCell(1).setCellValue(trans.getRecieamount());
//			row.createCell(2).setCellValue(trans.getTransferdatetime());
//		}
//		
//		
//
	}

	@RequestMapping("/todaytrans")
	public ModelAndView todaytrans(Model model) {
		System.out.println("inside today transaction----------->");
		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		LocalDate today = LocalDate.now();
		LocalDateTime startOfDay = today.atStartOfDay();
		LocalDateTime endOfDay = today.atTime(LocalTime.MAX);

		Timestamp startOfDayTimestamp = Timestamp.valueOf(startOfDay);
		Timestamp endOfDayTimestamp = Timestamp.valueOf(endOfDay);

		List<TransactionDetails> listoftransactiontoday = transaction.getAllTransactionBetween(id, acno,
				startOfDayTimestamp, endOfDayTimestamp);

		Iterator<TransactionDetails> iterator = listoftransactiontoday.iterator();

		while (iterator.hasNext()) {
			TransactionDetails trans = iterator.next();
			System.out.println("name=" + trans.getReciename());
			System.out.println("amount=" + trans.getRecieamount());
			System.out.println("time " + trans.getTransferdatetime());

		}

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "todaytrans");
		model.addAttribute("todaytranslist", listoftransactiontoday);
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");

	}

	@RequestMapping("/oneweektrans")
	public ModelAndView oneweektrans(Model model) {
		System.out.println("inside last seven days transactions--------->");
		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		LocalDate today = LocalDate.now();
		LocalDateTime startOfDay = today.minusDays(6).atStartOfDay();
		LocalDateTime endOfDay = today.atTime(LocalTime.MAX);
		Timestamp startOfDayTimestamp = Timestamp.valueOf(startOfDay);
		Timestamp endOfDayTimestamp = Timestamp.valueOf(endOfDay);

		List<TransactionDetails> listoflastseventrans = transaction.getAllTransactionBetween(id, acno,
				startOfDayTimestamp, endOfDayTimestamp);
//        Iterator<TransactionDetails> iterator = listoflastseventrans.iterator();
//
//    	while (iterator.hasNext()) {
//    		TransactionDetails trans = iterator.next();
//    		System.out.println("name=" + trans.getReciename());
//    		System.out.println("amount=" + trans.getRecieamount());
//    		System.out.println("time " + trans.getTransferdatetime());
//
//    	}

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "lastoneweekseventrans");
		model.addAttribute("listoflastseventrans", listoflastseventrans);
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");
	}

	@RequestMapping("/custrans")
	public ModelAndView custrans(Model model, @RequestParam String startdate, @RequestParam String enddate)
			throws ParseException {

		System.out.println("inside custom transfer------>");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		Timestamp startdatetrans = new Timestamp(dateFormat.parse(startdate).getTime());

		Timestamp enddatetrans = new Timestamp(dateFormat.parse(enddate).getTime());

		List<TransactionDetails> listofcusttrans = transaction.getAllTransactionBetween(id, acno, startdatetrans,
				enddatetrans);

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "customtrans");
		model.addAttribute("tabledet", "cutomizetabledetails");
		model.addAttribute("listofcusttrans", listofcusttrans);

		model.addAttribute("user", userinfo);

		return new ModelAndView("User");

	}

	@RequestMapping("/thisweektrans")
	public ModelAndView thisweektrans(Model model) {
		System.out.println("this week transaction----------->");

		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		LocalDate today = LocalDate.now();
		LocalDate startday = today.with(DayOfWeek.MONDAY);
		LocalDateTime localstartdaytime = startday.atStartOfDay();
		LocalDateTime endOfDay = today.atTime(LocalTime.MAX);

		Timestamp startoftrans = Timestamp.valueOf(localstartdaytime);
		Timestamp endoftrans = Timestamp.valueOf(endOfDay);

		List<TransactionDetails> listofthistrans = transaction.getAllTransactionBetween(id, acno, startoftrans,
				endoftrans);

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "thisweektrans");
		model.addAttribute("listofthistrans", listofthistrans);
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");

	}

	@RequestMapping("/onemonthtrans")
	public ModelAndView onemonthtrans(Model model) {
		System.out.println("inside one month trans----------->");
		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		LocalDate today = LocalDate.now();
		LocalDate start = today.minus(Period.ofDays(30));
		LocalDateTime startofday = start.atStartOfDay();
		LocalDateTime endOfDay = today.atTime(LocalTime.MAX);

		Timestamp startoftrans = Timestamp.valueOf(startofday);
		Timestamp endoftrans = Timestamp.valueOf(endOfDay);

		List<TransactionDetails> listofonemonthtrans = transaction.getAllTransactionBetween(id, acno, startoftrans,
				endoftrans);

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "onemonthtrans");
		model.addAttribute("listofonemonthtrans", listofonemonthtrans);
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");

	}

	@RequestMapping("/thismonthtrans")
	public ModelAndView thismonthtrans(Model model) {

		System.out.println("inside this moth trans----------->");

		int id = userinfo.getId();
		String acno = userinfo.getAcno();

		LocalDate today = LocalDate.now();
		LocalDate startofday = today.withDayOfMonth(1);
		LocalDateTime startday = startofday.atStartOfDay();
		LocalDateTime endOfDay = today.atTime(LocalTime.MAX);

		Timestamp startoftrans = Timestamp.valueOf(startday);
		Timestamp endoftrans = Timestamp.valueOf(endOfDay);
		List<TransactionDetails> listofthismonthtrans = transaction.getAllTransactionBetween(id, acno, startoftrans,
				endoftrans);

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "thismonthtrans");
		model.addAttribute("listofthismonthtrans", listofthismonthtrans);
		model.addAttribute("user", userinfo);

		return new ModelAndView("User");

	}

	@RequestMapping("/customdetailstrans")
	public ModelAndView customdetailstrans(Model model) {

		model.addAttribute("userstatus", "transactionhistory");
		model.addAttribute("whichtrans", "customtrans");

		model.addAttribute("user", userinfo);

		return new ModelAndView("User");
	}

	@RequestMapping("/loginaccess")
	public ModelAndView loginAccess(Model model, @RequestParam String username, @RequestParam String password) {
		if (username.equals("admin") && password.equals("123")) {

			model.addAttribute("message", "Welcome Admin");
			return new ModelAndView("Admin");
		}
		List<User1> listofuser = userservice.findAll();

		Iterator<User1> iterator = listofuser.iterator();

		try {
			int regid = Integer.parseInt(username);
			while (iterator.hasNext()) {
				User1 user = iterator.next();
				if (user.getCustid() == regid && user.getPassword().equals(password)) {
					if (user.getStatus().equals("inactive")) {
						model.addAttribute("message", "InActive User PLease Contact Admin");
						return new ModelAndView("Home");
					} else {
						userinfo = user;
						System.out.println("user name=" + userinfo.getName());
						model.addAttribute("message", "Welcome " + userinfo.getName());

						model.addAttribute("userstatus", "accountinformation");
						model.addAttribute("user", userinfo);
						return new ModelAndView("User");
					}
				}

			}

		} catch (Exception e) {

			model.addAttribute("message", "invalid username or password");
			return new ModelAndView("Home");
		}

		model.addAttribute("message", "User Not Found");
		return new ModelAndView("Home");

	}

	@RequestMapping("/insertuser")
	public ModelAndView insertUser(Model model, @RequestParam String customername, @RequestParam String accountnum,
			@RequestParam String branchname, @RequestParam String address, @RequestParam String pannum,
			@RequestParam String aadharnum, @RequestParam String password, @RequestParam String status,
			@RequestParam String ifsccode) {
		User1 user = new User1();
		user.setName(customername);
		user.setAcno(accountnum);
		user.setBranch(branchname);
		user.setAddress(address);
		user.setPanno(pannum);

		user.setAadharno(aadharnum);
		user.setPassword(password);
		user.setStatus(status);
		user.setIfsccode(ifsccode);
		user.setAccbalance(1000);
		int custid = userservice.getCustomerId() + 1;
		if (custid > 2000) {
			user.setCustid(custid);
		} else {
			user.setCustid(2000);
		}
		try {
			userservice.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Account Number,Aadhar Number,Pan Number must be unique");
			model.addAttribute("editstatus", "N");
			int custid1 = userservice.getCustomerId() + 1;
			model.addAttribute("customerid", custid1);
			return new ModelAndView("UserCreation");
		}
		model.addAttribute("message", "data inserted successfully");
		model.addAttribute("editstatus", "N");
		return new ModelAndView("UserCreation");
	}

	@RequestMapping("/reciepienttransfer")
	public ModelAndView reciepientTransfer(Model model, @RequestParam String accno, @RequestParam String ifsccode,
			@RequestParam String reciname, @RequestParam double amount) {
		List<User1> listofuser = userservice.findAll();
		model.addAttribute("listofuser", listofuser);
		model.addAttribute("userstatus", "moneytransfer");
		double accbal = userinfo.getAccbalance();
		if (amount > accbal) {

			model.addAttribute("msg", "Failure-Insufficient Balance");

			return new ModelAndView("User");
		}

//		LocalDateTime dateTime = LocalDateTime.now();
//
//	      
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//
//        
//        String formattedDateTime = dateTime.format(formatter);
//        
//        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//
//      
//            // Convert String to LocalDateTime
//            LocalDateTime dateTime2 = LocalDateTime.parse(formattedDateTime, formatter2);
//            System.out.println("Parsed LocalDateTime: " + dateTime2);

		Timestamp timestamp = Timestamp.from(Instant.now());

		List<User1> listofuser1 = userservice.findAll();

		Iterator<User1> iterator = listofuser1.iterator();

		while (iterator.hasNext()) {
			User1 user1 = iterator.next();
			if (user1.getAcno().equals(accno) && user1.getName().equals(reciname)
					&& user1.getIfsccode().equals(ifsccode)) {

				System.out.println("user name=" + userinfo.getName());

				double currentbal = user1.getAccbalance();

				double setbal = currentbal + amount;

				User1 user2 = new User1();
				user2.setId(user1.getId());
				user2.setName(user1.getName());
				user2.setAcno(user1.getAcno());
				user2.setBranch(user1.getBranch());
				user2.setAddress(user1.getAddress());
				user2.setPanno(user1.getPanno());
				user2.setAadharno(user1.getAadharno());
				user2.setPassword(user1.getPassword());
				user2.setStatus(user1.getStatus());
				user2.setCustid(user1.getCustid());
				user2.setIfsccode(user1.getIfsccode());
				user2.setAccbalance(setbal);

				userservice.updateUser(user2);

				double bal = accbal - amount;
				User1 user = new User1();
				user.setId(userinfo.getId());
				user.setName(userinfo.getName());
				user.setAcno(userinfo.getAcno());
				user.setBranch(userinfo.getBranch());
				user.setAddress(userinfo.getAddress());
				user.setPanno(userinfo.getPanno());
				user.setAadharno(userinfo.getAadharno());
				user.setPassword(userinfo.getPassword());
				user.setStatus(userinfo.getStatus());
				user.setIfsccode(userinfo.getIfsccode());
				user.setCustid(userinfo.getCustid());
				user.setAccbalance(bal);

				userservice.updateUser(user);
				model.addAttribute("msg", "Amount Transfered Successfully");

				User1 newuser = userservice.findById(user.getId());
				userinfo = newuser;
				TransactionDetails trans = new TransactionDetails();
				trans.setRecieaccno(accno);
				trans.setRecieamount(amount);
				trans.setTransferdatetime(timestamp);
				trans.setRecieifsccode(ifsccode);
				trans.setReciename(reciname);
				trans.setUser1(userinfo);

				transaction.insertTransaction(trans);
				model.addAttribute("user", userinfo);
				return new ModelAndView("User");
			}

		}
		model.addAttribute("user", userinfo);
		model.addAttribute("msg", "Transfer Failed---User Not Found");
		return new ModelAndView("User");

	}

	@RequestMapping("/usercreation")
	public ModelAndView usercreation(Model model) {
		int custid = userservice.getCustomerId() + 1;
		model.addAttribute("customerid", custid);
		model.addAttribute("message", "Here you can add new User Account");
		model.addAttribute("editstatus", "N");
		return new ModelAndView("UserCreation");
	}

	@RequestMapping("/adminportal")
	public ModelAndView adminportal(Model model) {
		model.addAttribute("message", "Welcome to Admin Portal");
		Long totalcustomers = userservice.numberOfUsers();
		model.addAttribute("totalcust", totalcustomers);

		double totalbal = userservice.summOfAllBalance();
		model.addAttribute("totalcustsav", totalbal);

		long aclistu = userservice.activeUser();
		long listuin = userservice.inActiveUser();

		double activbalance = userservice.activeTotalSalary();
		double inactivbalance = userservice.inActiveTotalSalary();
		System.out.println("active cust" + aclistu);
		System.out.println("inactive cust" + listuin);
		List<User1> listofuser = userservice.findAll();

		model.addAttribute("activbalance", activbalance);
		model.addAttribute("inactivbalance", inactivbalance);

		model.addAttribute("noofactive", aclistu);
		model.addAttribute("noofinactive", listuin);
		model.addAttribute("customerdetails", listofuser);
		return new ModelAndView("AdminPortal");
	}

	@RequestMapping("/edituser")
	public ModelAndView edituser(Model model, @RequestParam int regid) {

		System.out.println("edit user inside------------->");
		User1 newuser3 = userservice.findByCusId(regid);
		model.addAttribute("editcustomer", newuser3);
		model.addAttribute("editstatus", "E");
		System.out.println("after query----------->");
		return new ModelAndView("UserCreation");

	}

	@RequestMapping("/updateuser")
	public ModelAndView updateuser(Model model, @RequestParam int customerid, @RequestParam String customername,
			@RequestParam String accountnum, @RequestParam String branchname, @RequestParam String address,
			@RequestParam String pannum, @RequestParam String ifsccode, @RequestParam String aadharnum,
			@RequestParam String password, @RequestParam String status) {

		System.out.println("inside update user--------------->");
		User1 user = new User1();
		User1 newuser3 = userservice.findByCusId(customerid);
		user.setId(newuser3.getId());
		user.setName(customername);
		user.setAcno(accountnum);
		user.setBranch(branchname);
		user.setAddress(address);
		user.setPanno(pannum);
		user.setAadharno(aadharnum);
		user.setPassword(password);
		user.setStatus(status);

		user.setIfsccode(newuser3.getIfsccode());
		user.setCustid(newuser3.getCustid());
		user.setAccbalance(newuser3.getAccbalance());

		List<User1> listofuser = userservice.findAll();

		model.addAttribute("customerdetails", listofuser);
		try {
			userservice.updateUser(user);
		} catch (Exception e) {
			System.out.println("inside exception---------->");
			List<User1> listofuser1 = userservice.findAll();
			model.addAttribute("customerdetails", listofuser1);
			model.addAttribute("message1", "Account Number,Aadhar Number,Pan Number must be unique");
			Long totalcustomers = userservice.numberOfUsers();
			model.addAttribute("totalcust", totalcustomers);

			double totalbal = userservice.summOfAllBalance();
			model.addAttribute("totalcustsav", totalbal);

			double activbalance = userservice.activeTotalSalary();
			double inactivbalance = userservice.inActiveTotalSalary();
			model.addAttribute("activbalance", activbalance);
			model.addAttribute("inactivbalance", inactivbalance);
			long aclistu = userservice.activeUser();
			long listuin = userservice.inActiveUser();

			model.addAttribute("noofactive", aclistu);
			model.addAttribute("noofinactive", listuin);

			return new ModelAndView("AdminPortal");
		}
		Long totalcustomers = userservice.numberOfUsers();
		model.addAttribute("totalcust", totalcustomers);

		double totalbal = userservice.summOfAllBalance();
		model.addAttribute("totalcustsav", totalbal);

		double activbalance = userservice.activeTotalSalary();
		double inactivbalance = userservice.inActiveTotalSalary();
		model.addAttribute("activbalance", activbalance);
		model.addAttribute("inactivbalance", inactivbalance);
		long aclistu = userservice.activeUser();
		long listuin = userservice.inActiveUser();

		model.addAttribute("noofactive", aclistu);
		model.addAttribute("noofinactive", listuin);
		model.addAttribute("message1", "User Updated Successfully");
		return new ModelAndView("AdminPortal");

	}

	@RequestMapping("/adminpage")
	public ModelAndView adminpage(Model model) {
		System.out.println("inside admin back page------------>");
		return new ModelAndView("Admin");
	}

	
	
	@GetMapping("/csvfiledownload")
	public ResponseEntity<byte[]> downloadCsv() throws IOException {
       System.out.println("inside csv-------->");
        List<String> headersList = Arrays.asList( "Aadhar No", "Account No", "Address", "Branch", "IFSC Code",
                "Name", "Password", "Status","Pan No");

       
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(byteArrayOutputStream);

       
        outputStreamWriter.write(String.join(",", headersList));
        outputStreamWriter.write("\n");

        outputStreamWriter.flush();

       
        byte[] csvData = byteArrayOutputStream.toByteArray();

   
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=data.csv");
        headers.add(HttpHeaders.CONTENT_TYPE, "text/csv");

        return new ResponseEntity<>(csvData, headers, HttpStatus.OK);
    }
	
	
	
	
	
	@GetMapping("/csvdownload")
	public ResponseEntity<Resource> getFile() {
		String filename = "user.csv";
		InputStreamResource file = new InputStreamResource(toCsv());

		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
				.contentType(MediaType.parseMediaType("application/csv")).body(file);
	}

	public ByteArrayInputStream toCsv()

	{

		final CSVFormat format = CSVFormat.DEFAULT.withQuoteMode(QuoteMode.MINIMAL);

		try (ByteArrayOutputStream out = new ByteArrayOutputStream();
				CSVPrinter csvPrinter = new CSVPrinter(new PrintWriter(out), format);)

		{

			List<String> headers = Arrays.asList("ID", "Aadhar No", "Account No", "Address", "Branch", "IFSC Code",
					"Name", "Password", "Status", "Account Balance");

			csvPrinter.printRecord(headers);

			List<User1> listofuser = userservice.findAll();

			for (User1 liuser : listofuser) {
				List<String> data = Arrays.asList(String.valueOf(liuser.getId()), liuser.getAadharno(),
						liuser.getAcno(), liuser.getAddress(), liuser.getBranch(), liuser.getIfsccode(),
						liuser.getName(), liuser.getPassword(), liuser.getStatus(),
						String.valueOf(liuser.getAccbalance())

				);

				csvPrinter.printRecord(data);

			}

			csvPrinter.flush();

			ByteArrayInputStream st = new ByteArrayInputStream(out.toByteArray());

			return st;

		} catch (IOException e) {
			throw new RuntimeException("fail to import data to CSV file: " + e.getMessage());
		}

	}

	@PostMapping("/uploadcsv")
	public ModelAndView UploadCSV(Model model, @RequestParam("files") MultipartFile[] files) {
		for (MultipartFile file : files) {

			try {
				List<User1> users = csToUser(file.getInputStream());
				Iterator<User1> iterator = users.iterator();
				while (iterator.hasNext()) {
					User1 usersss = iterator.next();
					try {
						userservice.insertUser(usersss);
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "Account Number,Aadhar Number,Pan Number must be unique");
						model.addAttribute("editstatus", "N");

						return new ModelAndView("UserCreation");
					}

				}

			} catch (IOException e) {
				throw new RuntimeException("fail to store csv data: " + e.getMessage());
			}

		}

		model.addAttribute("message", "data  successfully through CSV");
		model.addAttribute("editstatus", "N");
		return new ModelAndView("UserCreation");

	}

	public List<User1> csToUser(InputStream is) {
		List<User1> users = new ArrayList();
		try (BufferedReader fileReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				CSVParser csvParser = new CSVParser(fileReader,
						CSVFormat.DEFAULT.withFirstRecordAsHeader().withTrim())) {

			Iterable<CSVRecord> csvre = csvParser.getRecords();
			int customeriduse;
			int custid = userservice.getCustomerId() + 1;
			if (custid > 2000) {
				customeriduse = custid;
			} else {
				customeriduse = 2000;
			}

			for (CSVRecord csvRecord : csvre) {
				User1 user = new User1();

				user.setAadharno(csvRecord.get("Aadhar No"));
				user.setAcno(csvRecord.get("Account No"));
				user.setAddress(csvRecord.get("Address"));
				user.setBranch(csvRecord.get("Branch"));
				user.setIfsccode(csvRecord.get("IFSC Code"));
				user.setName(csvRecord.get("Name"));
				user.setPassword(csvRecord.get("Password"));
				user.setStatus(csvRecord.get("Status"));
				user.setPanno(csvRecord.get("Pan No"));
				user.setAccbalance(1000);
				user.setCustid(customeriduse);

				users.add(user);
				customeriduse++;
			}

			return users;

		} catch (IOException e) {

			e.printStackTrace();
		}

		return users;

	}

	@GetMapping("/downloadExcel")
	public ResponseEntity<byte[]> downloadExcel() {
		try (Workbook workbook = new XSSFWorkbook()) {
			Sheet sheet = workbook.createSheet("Data");

			// Create header row
			Row headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("Id");
			headerRow.createCell(1).setCellValue("Customer Id");
			headerRow.createCell(2).setCellValue("Name");
			headerRow.createCell(3).setCellValue("Aadhar No");
			headerRow.createCell(4).setCellValue("Pan No");
			headerRow.createCell(5).setCellValue("Account Balance");
			headerRow.createCell(6).setCellValue("Branch");
			headerRow.createCell(7).setCellValue("IFSC Code");
			headerRow.createCell(8).setCellValue("Address");
			headerRow.createCell(9).setCellValue("Password");
			headerRow.createCell(10).setCellValue("Status");

			// Fetch data from database
			List<User1> dataList = userservice.findAll();
			// List<DataModel> dataList = dservice.findAll();

			// Populate data rows
			int rowIndex = 1;
			for (User1 data : dataList) {
				Row row = sheet.createRow(rowIndex++);
				row.createCell(0).setCellValue(data.getId());
				row.createCell(1).setCellValue(data.getCustid());
				row.createCell(2).setCellValue(data.getName());
				row.createCell(3).setCellValue(data.getAadharno());
				row.createCell(4).setCellValue(data.getPanno());
				row.createCell(5).setCellValue(data.getAccbalance());
				row.createCell(6).setCellValue(data.getBranch());
				row.createCell(7).setCellValue(data.getIfsccode());
				row.createCell(8).setCellValue(data.getAddress());
				row.createCell(9).setCellValue(data.getPassword());
				row.createCell(10).setCellValue(data.getStatus());

			}

			// Write workbook to byte array
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			workbook.write(bos);
			byte[] excelBytes = bos.toByteArray();

			// Set headers and content for the response
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment", "data.xlsx");
			headers.setContentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM);

			return new ResponseEntity<>(excelBytes, headers, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
