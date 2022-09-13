// #12 - Test Runner in Karate Junit5 || Run Feature Files from Maven Command Line

// https://www.youtube.com/watch?v=_Hl4iP-uQxQ&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=14

package features;

import com.intuit.karate.junit5.Karate;

public class TestRummer {
    @Karate.Test
    Karate getAPITest(){
        return Karate.run("getApi").relativeTo(getClass());
    }

    @Karate.Test
    Karate deleteAPITest(){
        return Karate.run("deleteApi").relativeTo(getClass());
    }

    @Karate.Test
    Karate postAPITest(){
        return Karate.run("postApi").relativeTo(getClass());
    }

    @Karate.Test
    Karate putAPITest(){
        return Karate.run("putApi").relativeTo(getClass());
    }

    @Karate.Test
    Karate jsonTest(){
        return Karate.run("json").relativeTo(getClass());
    }


}
