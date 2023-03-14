describe("Add to Cart", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicking on Add to Cart button should increase cart count", () => {
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(3) > .nav-link').contains("0");
    cy.get('.button_to > .btn').contains("Add").click({force: true});
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(3) > .nav-link').contains("1");

  });



});


