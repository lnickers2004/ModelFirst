
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/18/2013 17:28:11
-- Generated from EDMX file: Z:\Dropbox2\Dropbox\visual_studio_11_Projects\ENTITY_FRAMEWORK_PROJECTS\Fluent EF\Source Code\ModelFirst\ModelFirst\ModelFirstRecipes.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ModelFirstV1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RecipeRecipeIngredient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecipeIngredients] DROP CONSTRAINT [FK_RecipeRecipeIngredient];
GO
IF OBJECT_ID(N'[dbo].[FK_RecipeRecipeStep]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecipeSteps] DROP CONSTRAINT [FK_RecipeRecipeStep];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Recipes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Recipes];
GO
IF OBJECT_ID(N'[dbo].[RecipeIngredients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RecipeIngredients];
GO
IF OBJECT_ID(N'[dbo].[RecipeSteps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RecipeSteps];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Recipes'
CREATE TABLE [dbo].[Recipes] (
    [RecipeId] int IDENTITY(1,1) NOT NULL,
    [RecipeName] nvarchar(max)  NOT NULL,
    [Headnote] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RecipeIngredients'
CREATE TABLE [dbo].[RecipeIngredients] (
    [IngredientId] int IDENTITY(1,1) NOT NULL,
    [RecipeId] int  NOT NULL,
    [Preparation] nvarchar(max)  NOT NULL,
    [Amount] int  NOT NULL,
    [Unit] int  NOT NULL
);
GO

-- Creating table 'RecipeSteps'
CREATE TABLE [dbo].[RecipeSteps] (
    [StepNumber] int IDENTITY(1,1) NOT NULL,
    [RecipeID] int  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Recipe_RecipeId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RecipeId] in table 'Recipes'
ALTER TABLE [dbo].[Recipes]
ADD CONSTRAINT [PK_Recipes]
    PRIMARY KEY CLUSTERED ([RecipeId] ASC);
GO

-- Creating primary key on [IngredientId] in table 'RecipeIngredients'
ALTER TABLE [dbo].[RecipeIngredients]
ADD CONSTRAINT [PK_RecipeIngredients]
    PRIMARY KEY CLUSTERED ([IngredientId] ASC);
GO

-- Creating primary key on [StepNumber] in table 'RecipeSteps'
ALTER TABLE [dbo].[RecipeSteps]
ADD CONSTRAINT [PK_RecipeSteps]
    PRIMARY KEY CLUSTERED ([StepNumber] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RecipeId] in table 'RecipeIngredients'
ALTER TABLE [dbo].[RecipeIngredients]
ADD CONSTRAINT [FK_RecipeRecipeIngredient]
    FOREIGN KEY ([RecipeId])
    REFERENCES [dbo].[Recipes]
        ([RecipeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeRecipeIngredient'
CREATE INDEX [IX_FK_RecipeRecipeIngredient]
ON [dbo].[RecipeIngredients]
    ([RecipeId]);
GO

-- Creating foreign key on [Recipe_RecipeId] in table 'RecipeSteps'
ALTER TABLE [dbo].[RecipeSteps]
ADD CONSTRAINT [FK_RecipeRecipeStep]
    FOREIGN KEY ([Recipe_RecipeId])
    REFERENCES [dbo].[Recipes]
        ([RecipeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RecipeRecipeStep'
CREATE INDEX [IX_FK_RecipeRecipeStep]
ON [dbo].[RecipeSteps]
    ([Recipe_RecipeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------