<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class UserAccess
{
    public function handle(Request $request, Closure $next, $userType)
    {
        if(auth()->user()->user_type == $userType){
            return $next($request);
        }
        
        return response()->json("No Access");
    }
}
