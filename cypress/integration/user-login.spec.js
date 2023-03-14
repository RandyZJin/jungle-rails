describe("User Authentication", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("should redirect to registration page ", () => {
    cy.get(':nth-child(5) > .nav-link').click();
    cy.contains("Signup!");
  });

  it("should register using an unregisted email", () => {
    cy.visit("/");
    cy.get(':nth-child(5) > .nav-link').click();
    cy.contains("Signup!");
    cy.get('#user_first_name').type("Mike");
    cy.get('#user_last_name').type("Hannigan");
    cy.get('#user_email').type("MikeHannigan@gmail.com");
    cy.get('#user_password').type("password");
    cy.get('#user_password_confirmation').type("password");
    cy.get('[type="submit"]').click();
    cy.get('#navbarSupportedContent').contains("Mike Hannigan").should("exist");
  });

  it("should be able to log in as a registered user", () => {
    cy.visit("/");
    cy.get(':nth-child(4) > .nav-link').click();
    cy.get('#email').type("MikeHannigan@gmail.com");
    cy.get('#password').type("password");
    cy.get('[type="submit"]').click();
    cy.get('#navbarSupportedContent').contains("Mike Hannigan").should("exist");
  });

  it("should not be able to sign in with the wrong password", () => {
    cy.visit("/");
    cy.get(':nth-child(4) > .nav-link').click();
    cy.get('#email').type("MikeHannigan@gmail.com");
    cy.get('#password').type("passw0rd");
    cy.get('[type="submit"]').click();
    cy.get('main.container > h1').contains("Login").should("exist");
  });

  it("should not be able to sign in with an unregistered email", () => {
    cy.visit("/");
    cy.get(':nth-child(4) > .nav-link').click();
    cy.get('#email').type("PhoebeBuffay@gmail.com");
    cy.get('#password').type("password");
    cy.get('[type="submit"]').click();
    cy.get('main.container > h1').contains("Login").should("exist");
  });

});