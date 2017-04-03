package cnew.controllers.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by hjdeng on 4/3/17.
 */

@Controller
public class Index {

    HttpServletRequest _request;

    HttpServletResponse _response;

    public Index(HttpServletRequest req, HttpServletResponse resp) {
        this._request = req;
        this._response = resp;
    }

    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
