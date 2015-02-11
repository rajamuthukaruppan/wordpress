package com.test;
 
import java.util.List;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

/**
 * This is the non-ibatis implementation.
 */
@Repository("itemDataManager")
public class ItemDataManagerImpl implements ItemDataManager {
    private final Log logger = LogFactory.getLog(ItemDataManagerImpl.class);
    private SqlMapClientTemplate sqlMapClientTemplate;
  
    public SqlMapClientTemplate getSqlMapClientTemplate() {
        return sqlMapClientTemplate;
    }
  
    @Autowired
    @Required
    public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
        this.sqlMapClientTemplate = sqlMapClientTemplate;
    }
  
    @Override
    public Item getItemInfo(Integer itemId) {
        return (Item)getSqlMapClientTemplate().queryForObject("getItemInfo", itemId);
    }
  
    @Override
    public Item createItem(Item item) {
        Integer id = (Integer) getSqlMapClientTemplate().insert("itemInsert", item);
        item.setItemId(id);
        return item;
    }
  
    @Override
    public void deleteItem(Integer itemId) {
        if(itemId != null) {
            getSqlMapClientTemplate().delete("deleteItem", itemId);
        }
    }
    @Override
    public void deleteItemImage(Integer itemId) {
        if(itemId != null) {
            getSqlMapClientTemplate().delete("deleteItemImage", itemId);
        }
    }
  
    @Override
    public void updateItem(Item item) {
        getSqlMapClientTemplate().update("updateItem", item);
    }
  
    @Override
    public int getItemCount() {
        return 0;
    }
 
    @Override
    public List<Item> getAllItems(int skipResults, int maxItems) {
        List<Item> list = null;
  
        list = getSqlMapClientTemplate().queryForList("allItems", null, skipResults, maxItems);
  
        return list;
    }
  
}
