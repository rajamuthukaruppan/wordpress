package test.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.RootPanel;

/**
 * to run: mvn clean compile gwt:run
 */
public class Matrix implements EntryPoint {
	private final GreetingServiceAsync greetingService = GWT.create(GreetingService.class);

	@Override
	public void onModuleLoad() {
		Button button = new Button("Send", new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				Window.alert("Hello World!");
				greetingService.greetServer("World", new AsyncCallback<String>() {
					@Override
					public void onFailure(Throwable caught) {
						// Show the RPC error message to the user
						Window.alert("Remote Procedure Call - Failure");
					}

					@Override
					public void onSuccess(String result) {
						Window.alert(result);
					}
				});

			}
		});
		button.setStyleName("sendButton");
		RootPanel.get("sendButtonContainer").add(button);
	}
}