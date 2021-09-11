package com.produkte.dao;

import java.util.List;




public interface UserDao
{
    boolean addUser(com.important.css.User user);
    boolean isAlreadyUser(String userEmail);
    com.important.css.User login(String userEmail,String password);
    String getUserType(String userEmail,String password);
    List<com.important.css.User> getAllUser(String userType);
    int getTotalUser();
    com.important.css.User getUserByUserId(int userId);
    boolean changePassword(int userId,String password);
    boolean forgetPassword(String userEmail,String userPhone,String password);
}
