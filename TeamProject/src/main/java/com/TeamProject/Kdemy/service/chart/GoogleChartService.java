package com.TeamProject.Kdemy.service.chart;

import org.json.simple.JSONObject;

public interface GoogleChartService {
	public JSONObject getChartData();
	public String view();
	public String memberchart();
}