package com.test;
 
import java.util.Date;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
@RequestMapping("/item")
public class ItemController {
 
    private ItemModel itemModel;
 
    @RequestMapping(method = RequestMethod.GET)
    public String itemInfo(HttpServletRequest request) {
        List <Item> items = itemModel.getAllItems(0, 100);
        request.setAttribute("items", items);
        return "index";
    }
 
    @RequestMapping(method = RequestMethod.POST)
    public String createItem(HttpServletRequest request,
            HttpServletResponse response) {
 
        if ("C".equals(request.getParameter("operation"))) {
            System.out.println("create");
            Item item = new Item();
            item.setName("item created: " + new Date());
            itemModel.createItem(item);
            String message = "newly created item: " + item.getItemId();
            System.out.println(message);
            request.setAttribute("message", message);
 
        } else if ("R".equals(request.getParameter("operation"))) {
            // left for the reader to implement
            Integer id = new Integer(request.getParameter("id"));
        	
        	System.out.println(itemModel.getItemInfo(id));
        } else if ("U".equals(request.getParameter("operation"))) {
            // left for the reader to implement
            Integer id = new Integer(request.getParameter("id"));
        	Item item = itemModel.getItemInfo(id);
        	item.setName("item updated: " + new Date());
        	itemModel.updateItem(item);
        } else if ("D".equals(request.getParameter("operation"))) {
            Integer id = new Integer(request.getParameter("id"));
            itemModel.deleteItem(id);
            String message = "item deleted: " + id;
            System.out.println(message);
            request.setAttribute("message", message);
        }
         
        request.setAttribute("items", itemModel.getAllItems(0, 100));
        return "index";
    }
 
    public ItemModel getItemModel() {
        return itemModel;
    }
 
    @Required
    @Autowired
    public void setItemModel(ItemModel itemModel) {
        this.itemModel = itemModel;
    }
 
}
