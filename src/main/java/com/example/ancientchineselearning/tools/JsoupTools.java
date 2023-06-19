package com.example.ancientchineselearning.tools;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JsoupTools {

    public static List<String> getIdioms(String text) throws IOException {
        List<String> result = new ArrayList<>();
        String url = "https://www.chazidian.com/cy/?q=" + text;

        Connection connection = Jsoup.connect(url);
        connection.data("q", text);
        Document document = connection.post();
        Elements elements = document.select("body > div.main > div.main_left > div.box > div.box_content > ul > li > a");

        Iterator<Element> iterator = elements.iterator();
        while (iterator.hasNext()) {
            String idiom = iterator.next().text();
            if (idiom != null &&  !"".equals(idiom)) {
                result.add(idiom);
            }
        }
        return result;
    }
}
