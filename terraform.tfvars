subscriptions_list = {
    subscription1 = {
        mangment_group = "Mangmet_group1"
        name = "subscrption1"
    }
    subscription2 = {
        mangment_group = "Mangmet_group2"
        name = "subscrption2"
    }
    subscription3 = {
        mangment_group = "Mangmet_group3"
        name = "subscrption2"
    }
}

mangemnt_groups_list = [{
  name="Mangmet_group2",
  parent_group="Mangmet_group1"
}, 
{ 
  name="Mangmet_group3",
  parent_group="Mangmet_group1"
}, 
{
  name="Mangmet_group4",
  parent_group="Mangmet_group1"
}]

mangment_policy_list = [{
  name="Mangmet_policy_1",
  managment_group="Mangmet_group1",
  value="some policy"
},
{
  name="Mangmet_policy_2",
  managment_group="Mangmet_group2",
  value="some policy"
},
{
  name="Mangmet_policy_3",
  managment_group="Mangmet_group3",
  value="some policy"
}]

subscription_policy_llist = [ {
  name="Mangmet_policy_1",
  subscription="subscription1",
  value="some policy"
},
{
  name="Mangmet_policy_1",
  subscription="subscription2",
  value="some policy"
},
{
  name="Mangmet_policy_1",
  subscription="subscription3",
  value="some policy"
} ]