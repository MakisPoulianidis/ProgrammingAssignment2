a <- 6
test <- function ()
{
        print (a)
        a <- 7
        test2 <- function ()
        {
                print (a)
                a <- 8
                print (a)
        }
        test2 ()
        print(a)
}
test()
print (a)
