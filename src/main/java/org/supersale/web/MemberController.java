package org.supersale.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.supersale.dto.SuperSaleResult;
import org.supersale.entity.Member;
import org.supersale.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.Map;

@Controller
@RequestMapping("/supersale") // url:/模組/資源/{id} e.g. /supersale/list
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(@ModelAttribute() Member member) {
        return "member/register";
    }

    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String register (@Validated({Member.registerValidation.class}) @ModelAttribute() Member member,
                            BindingResult result,
                            @RequestParam(required = false) String confirmPassword,
                            HttpSession session,
                            HttpServletResponse response) throws UnsupportedEncodingException {

        if(memberService.isUserExisted(member.getEmail())) {
            result.rejectValue("email", "error.user", "Email已被註冊");
        }
        if(!member.getPassword().equals(confirmPassword)) {
            result.rejectValue("password", "error.user", "兩次密碼不相同，請再次輸入");
        }

        if(result.hasErrors()) {
            return "member/register";
        } else {
            //新增會員
            memberService.insertMember(member);
            session.setAttribute("member", member);
            return "redirect:/supersale/list";
        }
    }

    @RequestMapping(value = "/member/edit", method = RequestMethod.GET)
    public String edit(@ModelAttribute() Member member) {
        return "member/editmember";
    }

    @RequestMapping(value = "/member/edit", method = RequestMethod.POST)
    public String edit(@RequestParam(required = false) String originalEmail,
                       @Validated({Member.editValidation.class}) @ModelAttribute Member member,
                       BindingResult result,
                       HttpSession session,
                       Model model) {

        if(!member.getEmail().equals(originalEmail) && memberService.isUserExisted(member.getEmail())) {
            result.rejectValue("email", "error.user", "Email已被註冊");
        }

        if(!result.hasErrors()) {
            memberService.updateMember(member);
            session.setAttribute("member", member);
            model.addAttribute("updateResult", "修改完成");
        }
        return "member/editmember";
    }

    @RequestMapping(value = "/member/changePassword", method = RequestMethod.GET)
    public String changePassword() {
        return "member/changepassword";
    }

    @RequestMapping(value="/member/changePassword", method = RequestMethod.POST)
    public String changePassword(@RequestParam(required = false) int customerId,
                                 @RequestParam(required = false) String oldPassword,
                                 @RequestParam(required = false) String newPassword,
                                 @RequestParam(required = false) String confirmPassword,
                                 Model model){
        boolean error = false;

        if(!memberService.isOldPasswordCorrect(customerId, oldPassword)) {
            model.addAttribute("oldPasswordValidate", "舊密碼輸入錯誤");
            error = true;
        }

        if(!memberService.isValidPassword(newPassword)) {
            model.addAttribute("newPasswordValidate", "密碼需包含英文及數字，且需在8至20字元內");
            error = true;
        }

        if(!newPassword.equals(confirmPassword)) {
            model.addAttribute("newPasswordValidate", "兩次密碼不相同，請再次輸入");
            error = true;
        }

        if(!error) {
            memberService.updatePassword(customerId, newPassword);
            model.addAttribute("result", "密碼已更新!");
        }
        return "member/changepassword";
    }

    //AJAX Json
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody   //將返回資訊(SuperSaleResult<Exposer>)封裝成Json格式，傳回給Browser
    public SuperSaleResult<Member> login(String email, String password, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {

        Member member = memberService.checkLogin(email, password);
        if(member != null) {
            session.setAttribute("member", member);
            return new SuperSaleResult<Member>(true, member);
        } else {
            return new SuperSaleResult<Member>(false, "帳號或密碼錯誤");
        }
    }

    @RequestMapping(value = "/isLogin", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Boolean> isLogin(HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        if(member == null) {
            return Collections.singletonMap("isLogin", false);
        }
        return Collections.singletonMap("isLogin", true);
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        session.removeAttribute("member");
        return "redirect:/supersale/list";
    }
}
