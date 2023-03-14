describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicking on the image redirects to product details page", () => {
    cy.get(':nth-child(1) > a > img').click();

    // In this case, scented blade should be visible on the page as it is the product cypress clicks on, but giant tea should not exist as that is the name of the product that was not clicked on.
    cy.get(':nth-child(2) > h1').contains("Scented Blade").should("exist");
    cy.contains("Giant Tea").should("not.exist");
  });
  
});


