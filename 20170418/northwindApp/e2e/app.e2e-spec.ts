import { NorthwindAppPage } from './app.po';

describe('northwind-app App', () => {
  let page: NorthwindAppPage;

  beforeEach(() => {
    page = new NorthwindAppPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
