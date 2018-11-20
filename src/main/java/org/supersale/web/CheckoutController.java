package org.supersale.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.supersale.entity.Product;
import org.supersale.entity.ShoppingOrder;
import org.supersale.exception.SuperSaleCloseException;
import org.supersale.exception.UnderstockException;
import org.supersale.service.ProductService;
import org.supersale.service.SuperSaleService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/supersale")
public class CheckoutController {

    @Autowired
    private SuperSaleService superSaleService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/{productId}/checkoutStep1", method = RequestMethod.GET)
    public String step1(@PathVariable("productId") int productId,
                        @ModelAttribute("shoppingOrder")  ShoppingOrder shoppingOrder,
                        @ModelAttribute("error") String error,
                        @ModelAttribute("stock") String stock,
                        Model model){

        Product product = productService.getProductById(productId);
        shoppingOrder.setProductName(product.getName());
        shoppingOrder.setPrice(product.getPrice());
        Map<Integer, Integer> numberList = new HashMap<Integer, Integer>();
        for(int i = 1; i <= product.getNumber(); i++) {
            numberList.put(i, i);
            // 單次購買數量的上限，先指定5次。
            // 如果未來有需求是依據個別商品，有不同的購買上限，
            // 可以在商品資料庫中添加新欄位，並在這邊做設定。
            if(i >= 5)
                break;
        }
        model.addAttribute("numberList", numberList);
        return "checkout/checkout_step1";
    }

    @RequestMapping(value = "/{productId}/checkoutStep2", method = { RequestMethod.POST, RequestMethod.GET })
    public String step1(@PathVariable("productId") int productId,
                        @Validated({ShoppingOrder.step1Validation.class}) @ModelAttribute("shoppingOrder")  ShoppingOrder shoppingOrder,
                        BindingResult result,
                        @ModelAttribute("error") String error) {

        if(result.hasErrors()) {
            return "checkout/checkout_step1";
        }
        return "checkout/checkout_step2";
    }

    @RequestMapping(value = "/{productId}/checkoutStep3", method = { RequestMethod.POST, RequestMethod.GET })
    public String step2(@PathVariable("productId") int productId,
                        @Validated({ShoppingOrder.step2Validation.class}) @ModelAttribute("shoppingOrder")  ShoppingOrder shoppingOrder,
                        BindingResult result,
                        RedirectAttributes redirectAttributes,
                        Model model) {

        if(result.hasErrors()) {
            return "checkout/checkout_step2";
        }
        //寫入資料庫
        try{
            shoppingOrder = superSaleService.executePurchase(shoppingOrder, productId);
            //訂單編號的shoppingOrder
            model.addAttribute(shoppingOrder);
        } catch(SuperSaleCloseException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/supersale/list";
        } catch(UnderstockException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/supersale/{productId}/checkoutStep1";
        }
        return "checkout/checkout_step3";
    }

    //返回JSON格式的訂購function，如果要改成SPA的話，從這邊下手
//    @RequestMapping(value = "/{productId}/checkoutResult", method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
//    @ResponseBody
//    public SuperSaleResult<ShoppingOrder> result(@PathVariable("productId") int productId, @ModelAttribute("order") ShoppingOrder shoppingOrder) {
//
//        SuperSaleResult<ShoppingOrder> result;
//        try{
//            superSaleService.executePurchase(shoppingOrder, productId);
//            result = new SuperSaleResult<ShoppingOrder>(true, shoppingOrder);
//        } catch(SuperSaleCloseException e) {
//            result = new SuperSaleResult<ShoppingOrder>(false, e.getMessage());
//        }
//        return result;
//    }
}
