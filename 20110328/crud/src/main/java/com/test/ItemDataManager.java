package com.test;
 
import java.util.List;
  
public interface ItemDataManager {
  
    public Item getItemInfo(Integer itemId);
  
    public Item createItem(Item item);
  
    public void updateItem(Item item);
  
    public void deleteItem(Integer itemId);
  
    List<Item> getAllItems(int skipResults, int maxItems);
  
    int getItemCount();
  
    public void deleteItemImage(Integer itemId);
}
