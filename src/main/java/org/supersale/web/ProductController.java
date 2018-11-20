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
import org.supersale.entity.Product;
import org.supersale.service.ProductService;

import java.util.List;

@Controller
@RequestMapping("/supersale/manage/product") // url:/模組/資源/{id} e.g. /supersale/list
public class ProductController {

    @Autowired
    private ProductService productService;

    // supersale/manage/product 會進到這裡
    @RequestMapping(method = RequestMethod.GET)
    public String products(Model model){

        List<Product> productList = productService.getProductList();
        model.addAttribute("productList", productList);
        return "manage/product";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(@ModelAttribute("product") Product product) {
        return "manage/createproduct";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createStep2(@Validated @ModelAttribute("product") Product product, BindingResult result) {

        if (result.hasErrors()) {
            return "manage/createproduct";
        }
//        productService.insertProduct(product.getName(), product.getNumber(), product.getPrice(), product.getStartTime(), product.getEndTime());
        productService.insertProduct(product);
        return "redirect:/supersale/manage/product";
    }

    @RequestMapping(value = "/{productId}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable("productId") int productId, Model model){

        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "manage/editproduct";
    }

    @RequestMapping(value = "/{productId}/edit", method = RequestMethod.POST)
    public String update(@PathVariable("productId") int productId, @Validated @ModelAttribute Product product, BindingResult result, Model model) {

        if(!result.hasErrors()) {
//            productService.updateProduct(productId, product.getName(), product.getNumber(), product.getPrice(), product.getStartTime(), product.getEndTime());
            productService.updateProduct(product);
            model.addAttribute("updateResult", "修改完成");
        }
        return "manage/editproduct";
    }

    @RequestMapping(value = "/{productId}/delete")
    public String delete(@PathVariable("productId") int productId){

        productService.deleteProduct(productId);
        return "redirect:/supersale/manage/product";
    }
}
