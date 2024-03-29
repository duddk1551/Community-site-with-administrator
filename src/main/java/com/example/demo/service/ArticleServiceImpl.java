package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.groovy.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Utils;
import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleDao articleDao;
	
	public Map<String,Object> getArticleList(Map<String, Object> param) {
		Map<String,Object> page = calcData(param);
		List<Article> list = articleDao.getArticleList(param);
		return Maps.of("list", list, "page", page);
	}
	
	private Map<String,Object> calcData(Map<String, Object> param) {
		Map<String,Object> rs = new HashMap<>();
		
		long totalCount = articleDao.getTotalCount(param);
		int perPageNum = 10;
		int pageBlock = 5;
		int cPage = Utils.getAsInt(param.get("cPage"));
		int startPage;
		int endPage;
		int limitPage;
		boolean next;
		boolean prev;
		
		endPage = (int) Math.ceil(cPage/(double) pageBlock) * pageBlock;
		startPage = endPage - pageBlock + 1;
		limitPage = (int) Math.ceil(totalCount / (double)perPageNum);
		if(endPage > limitPage) {
			endPage = limitPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage == limitPage ? false : true;
		
		rs.put("startPage", startPage);
		rs.put("endPage", endPage);
		rs.put("prev", prev);
		rs.put("next", next);
		
		param.put("startNum", (cPage - 1) * perPageNum);
		param.put("perPageNem", perPageNum);
		
		return rs;
	}
}
