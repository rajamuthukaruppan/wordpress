package com.test;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;
 
@Service
public class ItemModelImpl implements ItemModel {
 
    @Autowired
    @Qualifier("simpleItemDataManager")
    private ItemDataManager itemDataManager;   
     
    @Override
    public Item createItem(Item item) {
        return itemDataManager.createItem(item);
    }
 
    @Override
    public void deleteItem(Integer itemId) {
        itemDataManager.deleteItem(itemId);
    }
 
    @Override
    public void deleteItemImage(Integer itemId) {
        itemDataManager.deleteItemImage(itemId);
    }
 
    @Override
    public List<Item> getAllItems(int skipResults, int maxItems) {
        return itemDataManager.getAllItems(skipResults, maxItems);
    }
 
    @Override
    public int getItemCount() {
        return itemDataManager.getItemCount();
    }
 
    @Override
    public Item getItemInfo(Integer itemId) {
        return itemDataManager.getItemInfo(itemId);
    }
 
    @Override
    public void updateItem(Item item) {
        itemDataManager.updateItem(item);
    }
 
    public void setItemDataManager(ItemDataManager itemDataManager) {
        this.itemDataManager = itemDataManager;
    }
 
    public ItemDataManager getItemDataManager() {
        return itemDataManager;
    }
 
}
