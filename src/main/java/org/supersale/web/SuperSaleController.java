package org.supersale.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.supersale.entity.Member;
import org.supersale.entity.Product;
import org.supersale.entity.ShoppingOrder;
import org.supersale.service.ProductService;
import org.supersale.service.SuperSaleService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/supersale") // url:/模組/資源/{id} e.g. /supersale/list
public class SuperSaleController {

    @Autowired
    private SuperSaleService superSaleService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {

        //取得列表頁
        Date nowTime = new Date();
        List<Product> list = productService.getSellingList(nowTime);
        model.addAttribute("list", list);
        return "list"; //WEB-INF/jsp/list.jsp
    }

    @RequestMapping(value = "upcominglist", method = RequestMethod.GET)
    public String upcomingList(Model model) {

        Date nowTime = new Date();
        List<Product> list = productService.getUpcomingList(nowTime);
        model.addAttribute("list", list);
        return "upcominglist";
    }

    @RequestMapping(value = "orderinquiry", method = RequestMethod.GET)
    public String myOrder(Model model, HttpSession session){

        Member member = (Member) session.getAttribute("member");
        List<ShoppingOrder> orderList = superSaleService.getOrderList(member.getMemberId());
        model.addAttribute("orderList", orderList);
        return "member/orderinquiry";
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ShoppingOrder getOrderDetailJson(@PathVariable("id") int orderId) {

        ShoppingOrder shoppingOrder = superSaleService.getOrderById(orderId);
        return shoppingOrder;
    }

}
