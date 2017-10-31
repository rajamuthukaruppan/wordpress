import { ViewerAppPage } from './app.po';

describe('viewer-app App', () => {
  let page: ViewerAppPage;

  beforeEach(() => {
    page = new ViewerAppPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
