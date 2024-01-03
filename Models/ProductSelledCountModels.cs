﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace Models;

public class ProductDaySelledCount
{
    public DateTime Date { get; set; }
    public int SelledCount { get; set; }
}

public class ProductWeekSelledCount
{
    public DateTime StartWeek { get; set; }
    public int SelledCount { get; set; }
}

public class ProductMonthSelledCount
{
    public int Month { get; set; }
    public int SelledCount { get; set; }
}

public class ProductYearSelledCount
{
    public int Year { get; set; }
    public int SelledCount { get; set; }
}

public class ThisWeekProductSelledCount
{
    public int ProductId { get; set; }
    public string Name { get; set; } = null!;
    public int TotalQuantitySold { get; set; }
}

public class ThisMonthProductSelledCount
{
    public int ProductId { get; set; }
    public string Name { get; set; } = null!;
    public int TotalQuantitySold { get; set; }
}

public class ThisYearProductSelledCount
{
    public int ProductId { get; set; }
    public string Name { get; set; } = null!;
    public int TotalQuantitySold { get; set; }
}