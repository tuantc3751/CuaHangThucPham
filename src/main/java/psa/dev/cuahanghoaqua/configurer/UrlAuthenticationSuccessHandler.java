package psa.dev.cuahanghoaqua.configurer;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
	//Điều hướng đến request
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override //Chuyển đến request thích hợp với role khi xác thực thành công
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		handle(request, response, authentication);
		clearAuthenticationAttributes(request);	
	}
	
	//Dựa vào role của user login để xác định request chuyển dến (redirect)
	protected void handle (HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		//Lấy url theo role của user login
		if(response.isCommitted()) return;
		redirectStrategy.sendRedirect(request, response, targetUrl);
		//Điều hướng target URL
	}
	
	//Lấy role của user và trả về Url (Action) tương ứng với authentication
	protected String determineTargetUrl (final Authentication authentication) throws IllegalStateException {
		Map<String,String> roleTargetUrlMap = new HashMap<String, String>();
		roleTargetUrlMap.put("ADMIN", "/admin/product/view");
		roleTargetUrlMap.put("GUEST", "/index");
	
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); //Lấy danh sách các roles
		for(final GrantedAuthority grantedAuthority : authorities) {
			//authorities lấy trong class User
			String authorityName = grantedAuthority.getAuthority();
			
			//role name
			if(roleTargetUrlMap.containsKey(authorityName)) {
				//System.out.println("authorityName:" + authorityName);
				//System.out.println("role url map:" + roleTargetUrlMap.get(authoriryName).toString());
				return roleTargetUrlMap.get(authorityName);
				//Trả về target url của user đăng nhập
			}
		}
		throw new IllegalStateException();
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
