package com.khatkevich;

import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.mockito.Mockito.mock;

public class AuthenticationTest {

    @Test
    public void doGet() {
    }

    @Test
    public void doPost() throws Exception{
        Authentication check = new Authentication();
        HttpServletRequest req = mock(HttpServletRequest.class);
        HttpServletResponse resp = mock(HttpServletResponse.class);
        req.setAttribute("name", "max");
        req.setAttribute("agree", "resp");
        check.doPost(req, resp);
    }
}