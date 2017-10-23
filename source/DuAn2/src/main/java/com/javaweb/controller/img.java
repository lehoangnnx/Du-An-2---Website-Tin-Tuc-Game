package com.javaweb.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;

public class img {
	public boolean checkFolderExists(String path) {
		File file = new File(path);
		if (!file.exists()) {
			if (file.mkdirs()) {

				System.out.println("Directory is created!");
				return true;
			} else {
				System.out.println("Failed to create directory!");
				return false;
			}
		}
		return true;
	}
	public String renameFile(String fileName) {
        String[] arrImg = fileName.split("\\.");
        
        String duoiFileImg = arrImg[arrImg.length - 1];
        String nameFile = "";
        for (int i = 0; i < (arrImg.length - 1); i++) {
            if (i == 0) {
                nameFile = arrImg[i];
            } else {
                nameFile += "-" + arrImg[i];
            }
        }
        nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
        return nameFile;
    }
	
	public String getMonthAndYearNow() {
		Date date = new Date(); // your date
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String monthAndYear = cal.get(Calendar.MONTH) +"-"+ cal.get(Calendar.YEAR) + "/";
		
		return monthAndYear;
		
	}
}
