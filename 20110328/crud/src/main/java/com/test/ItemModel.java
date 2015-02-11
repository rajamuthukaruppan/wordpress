package com.test;
 
import java.util.List;
 
 
public interface ItemModel {
    /**
     * This is a pass-thru method that just calls the DataManager.
     */   
    public Item getItemInfo(Integer itemId);
  
    public Item createItem(Item item);
  
    public void updateItem(Item item);
  
    public void deleteItem(Integer itemId);
 
    /**
     * This is a pass-thru method that just calls the DataManager.
     */
    public List<Item> getAllItems(int skipResults, int maxItems);
 
    /**
     * This is a pass-thru method that just calls the DataManager.
     */
    public int getItemCount();
  
    public void deleteItemImage(Integer itemId);
     
}
