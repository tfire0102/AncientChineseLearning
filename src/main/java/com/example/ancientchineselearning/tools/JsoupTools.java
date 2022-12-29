package com.example.ancientchineselearning.tools;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JsoupTools {

    public static List<String> getIdioms(String text, int page) throws IOException {
        List<String> result = new ArrayList<>();
        String url = "http://www.66xo.com/api?app=search&q="+ text +"&page="+ page;

        Document document = Jsoup.connect(url).get();
        Elements elements = document.select("#category > ul > li > a");

        Iterator<Element> iterator = elements.iterator();
        while (iterator.hasNext()) {
            String idiom = iterator.next().text();
            if (idiom != null &&  !"".equals(idiom)) {
                result.add(idiom);
            }
        }
        if (elements.size() == 15) {
            List<String> res = getIdioms(text, page+1);
            for (String str : res) {
                result.add(str);
            }
        }
        return result;
    }
}
