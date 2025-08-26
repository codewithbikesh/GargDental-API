<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WebsiteData extends Model
{
    use HasFactory;
    protected $table = 'website_data'; // specify the correct table name
    protected $fillable = ['company_name', 'company_logo_header', 'company_logo_footer', 'primary_email', 'secondary_email', 'primary_phone', 'secondary_phone', 'address', 'website_link', 'shipping_cost_apply_type', 'no_category_display', 'map_url'];
}
