-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Qb8iG7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [email] string  NOT NULL ,
    CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

CREATE TABLE [campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] string  NOT NULL ,
    [description] string  NOT NULL ,
    [goal] float  NOT NULL ,
    [pledged] float  NOT NULL ,
    [outcome] string  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] string  NOT NULL ,
    [currency] string  NOT NULL ,
    [launch_date] date  NOT NULL ,
    [end_date] date  NOT NULL ,
    [category] string  NOT NULL ,
    [subcategory] string  NOT NULL ,
    CONSTRAINT [PK_campaign] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

CREATE TABLE [catagory] (
    [category_id] string  NOT NULL ,
    [category] string  NOT NULL ,
    CONSTRAINT [PK_catagory] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [subcatagory] (
    [subcategory_id] string  NOT NULL ,
    [subcategory] string  NOT NULL ,
    CONSTRAINT [PK_subcatagory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_contact_id] FOREIGN KEY([contact_id])
REFERENCES [contacts] ([contact_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_contact_id]

ALTER TABLE [catagory] WITH CHECK ADD CONSTRAINT [FK_catagory_category] FOREIGN KEY([category])
REFERENCES [campaign] ([category])

ALTER TABLE [catagory] CHECK CONSTRAINT [FK_catagory_category]

ALTER TABLE [subcatagory] WITH CHECK ADD CONSTRAINT [FK_subcatagory_subcategory] FOREIGN KEY([subcategory])
REFERENCES [campaign] ([subcategory])

ALTER TABLE [subcatagory] CHECK CONSTRAINT [FK_subcatagory_subcategory]

COMMIT TRANSACTION QUICKDBD