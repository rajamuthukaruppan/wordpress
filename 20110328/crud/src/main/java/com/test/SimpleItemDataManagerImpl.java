package com.test;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;
 
@Repository("simpleItemDataManager")
public class SimpleItemDataManagerImpl implements ItemDataManager {

	private final Log logger = LogFactory.getLog(SimpleItemDataManagerImpl.class);
    private SimpleJdbcTemplate jdbcTemplate;
    private SimpleJdbcInsert insertItem;
    
  @Autowired
  @Required
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new SimpleJdbcTemplate(dataSource);
		insertItem = new SimpleJdbcInsert(dataSource).withTableName("item")
				.usingGeneratedKeyColumns("item_id");
	}
	
    @Override
    public Item getItemInfo(Integer itemId) {
    	logger.info("using JDBCTemplate");
    	return jdbcTemplate.queryForObject( "select item_id as itemId, " +
    			"    oem_id as oemId, item_x as name, description as description, " +
    			"    color as color, image_url as imageURL, price as price, " +
    			"    length as length, width as width, height as height, " +
    			"    weight as weight, stock_qty as stockQty " +
    			"from item where item_id = ?", new ParameterizedRowMapper<Item>() {
					@Override
					public Item mapRow(ResultSet rs, int rowNum)
							throws SQLException {
                        Item item = new Item();
                        item.setItemId(rs.getInt(1));
                        item.setOemId(rs.getString(2));
                        item.setName(rs.getString(3));
                        item.setDescription(rs.getString(4));
                        item.setColor(rs.getString(5));
                        item.setImageURL(rs.getString(6));
                        item.setPrice(rs.getBigDecimal(7));
                        item.setLength(rs.getBigDecimal(8));
                        item.setWidth(rs.getBigDecimal(9));
                        item.setHeight(rs.getBigDecimal(10));
                        item.setWeight(rs.getBigDecimal(11));
                        item.setStockQty(rs.getInt(12));
                        return item;
					}
    	}, itemId);
    }
  
    @Override
    public Item createItem(Item item) {
    	logger.info("using JDBCTemplate");
    	
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("oem_id", item.getOemId());
        parameters.put("item_x", item.getName());
        parameters.put("description", item.getDescription());
        parameters.put("color", item.getColor());
        parameters.put("image_url", item.getImageURL());
        parameters.put("price", item.getPrice());
        parameters.put("length", item.getLength());
        parameters.put("width", item.getWidth());
        parameters.put("height", item.getHeight());
        parameters.put("weight", item.getWeight());
        parameters.put("stock_qty", item.getStockQty());
        
        Number newId = insertItem.executeAndReturnKey(parameters);
        item.setItemId(newId.intValue());
        return item;
    }
  
    @Override
    public void deleteItem(Integer itemId) {
    	logger.info("using JDBCTemplate");
    	
        if(itemId != null) {
        	jdbcTemplate.update("delete from item where item_id = ?;", itemId);
        }
    }
    @Override
    public void deleteItemImage(Integer itemId) {
        if(itemId != null) {
        	// not implemented.
        }
    }
  
	@Override
	public void updateItem(Item i) {
    	logger.info("using JDBCTemplate");
		
		jdbcTemplate.update(
				"update item set oem_id = ?, item_x = ?, description=?, "
						+ "color = ?, image_url = ?, price = ?, length = ?, "
						+ "width = ?, height = ?, weight = ?, stock_qty = ? "
						+ "where item_id = ? ", i.getOemId(), i.getName(),
				i.getDescription(), i.getColor(), i.getImageURL(),
				i.getPrice(), i.getLength(), i.getWidth(), i.getHeight(),
				i.getWeight(), i.getStockQty(), i.getItemId());
	}
  
    @Override
    public int getItemCount() {
    	logger.info("using JDBCTemplate");
    	
        return jdbcTemplate.queryForInt("select count(*) from item"); 
    }
 
    @Override
    public List<Item> getAllItems(int skipResults, int maxItems) {
    	logger.info("using JDBCTemplate");
    	
        return this.jdbcTemplate.<Item>query (
        		"select item_id as itemId, " +
        		"oem_id as oemId, item_x as name, description as description, " +
        		"color as color, image_url as imageURL, price as price, " +
        		"length as length, width as width, height as height, " +
        		"weight as weight, stock_qty as stockQty " +
        		"from item;",
                new ParameterizedRowMapper<Item>() {
                    public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Item item = new Item();
                        item.setItemId(rs.getInt(1));
                        item.setOemId(rs.getString(2));
                        item.setName(rs.getString(3));
                        item.setDescription(rs.getString(4));
                        item.setColor(rs.getString(5));
                        item.setImageURL(rs.getString(6));
                        item.setPrice(rs.getBigDecimal(7));
                        item.setLength(rs.getBigDecimal(8));
                        item.setWidth(rs.getBigDecimal(9));
                        item.setHeight(rs.getBigDecimal(10));
                        item.setWeight(rs.getBigDecimal(11));
                        item.setStockQty(rs.getInt(12));
                        return item;
                    }
                });
    }
  
}
