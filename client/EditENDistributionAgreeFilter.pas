
unit EditENDistributionAgreeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistributionAgreeController ;

type
  TfrmENDistributionAgreeFilterEdit = class(TDialogForm)

    lblEic : TLabel;
    edtEic: TEdit;

    lblObjectname : TLabel;
    edtObjectname: TMemo;

    lblObjectaddress : TLabel;
    edtObjectaddress: TMemo;

    lblPower : TLabel;
    edtPower: TEdit;

    lblD3countername : TLabel;
    edtD3countername: TMemo;

    lblD3countertype : TLabel;
    edtD3countertype: TMemo;

    lblD3amperageratio : TLabel;
    edtD3amperageratio: TEdit;

    lblD3voltageratio : TLabel;
    edtD3voltageratio: TEdit;

    lblD3totalratio : TLabel;
    edtD3totalratio: TEdit;

    lblD3place : TLabel;
    edtD3place: TMemo;

    lblD3voltageclass : TLabel;
    edtD3voltageclass: TEdit;

    lblD3workmode : TLabel;
    edtD3workmode: TEdit;

    lblD3tarifftype : TLabel;
    edtD3tarifftype: TEdit;

    lblD3accountingtype : TLabel;
    edtD3accountingtype: TEdit;

    lblD5feederlist : TLabel;
    edtD5feederlist: TEdit;

    lblD6reliabilitypue : TLabel;
    edtD6reliabilitypue: TEdit;

    lblD6reliabilityguaranteed : TLabel;
    edtD6reliabilityguaranteed: TEdit;

    lblD6balancesupplier : TLabel;
    edtD6balancesupplier: TMemo;

    lblD6balanceclient : TLabel;
    edtD6balanceclient: TMemo;

    lblD6responsibilitysupplier : TLabel;
    edtD6responsibilitysupplier: TMemo;

    lblD6responsibilityclient : TLabel;
    edtD6responsibilityclient: TMemo;

    lblD7linesource : TLabel;
    edtD7linesource: TMemo;

    lblD7attachment : TLabel;
    edtD7attachment: TMemo;

    lblD8conditions : TLabel;
    edtD8conditions: TMemo;

    lblD8transformertype : TLabel;
    edtD8transformertype: TMemo;

    lblD8voltagebh : TLabel;
    edtD8voltagebh: TEdit;

    lblD8voltagehh : TLabel;
    edtD8voltagehh: TEdit;

    lblD8lossesxx : TLabel;
    edtD8lossesxx: TEdit;

    lblD8losseskz : TLabel;
    edtD8losseskz: TEdit;

    lblD8amperage : TLabel;
    edtD8amperage: TEdit;

    lblD8voltagekz : TLabel;
    edtD8voltagekz: TEdit;

    lblD8linelength : TLabel;
    edtD8linelength: TEdit;

    lblD8liner : TLabel;
    edtD8liner: TEdit;

    lblD8linex : TLabel;
    edtD8linex: TEdit;

    lblD8hours : TLabel;
    edtD8hours: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;



  HTTPRIOENDistributionAgree: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDistributionAgreeFilterEdit: TfrmENDistributionAgreeFilterEdit;
  ENDistributionAgreeFilterObj: ENDistributionAgreeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDistributionAgreeController  ;
}
{$R *.dfm}



procedure TfrmENDistributionAgreeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPower
      ,edtD3amperageratio
      ,edtD3voltageratio
      ,edtD3totalratio
      ,edtD8voltagebh
      ,edtD8voltagehh
      ,edtD8lossesxx
      ,edtD8losseskz
      ,edtD8amperage
      ,edtD8voltagekz
      ,edtD8linelength
      ,edtD8liner
      ,edtD8linex
      ,edtD8hours
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtEic.Text := ENDistributionAgreeObj.eic; 



    MakeMultiline(edtObjectname.Lines, ENDistributionAgreeObj.objectname);



    MakeMultiline(edtObjectaddress.Lines, ENDistributionAgreeObj.objectaddress);



    if ( ENDistributionAgreeObj.power <> nil ) then
       edtPower.Text := ENDistributionAgreeObj.power.decimalString
    else
       edtPower.Text := ''; 



    MakeMultiline(edtD3countername.Lines, ENDistributionAgreeObj.d3countername);



    MakeMultiline(edtD3countertype.Lines, ENDistributionAgreeObj.d3countertype);



    if ( ENDistributionAgreeObj.d3amperageratio <> nil ) then
       edtD3amperageratio.Text := ENDistributionAgreeObj.d3amperageratio.decimalString
    else
       edtD3amperageratio.Text := ''; 



    if ( ENDistributionAgreeObj.d3voltageratio <> nil ) then
       edtD3voltageratio.Text := ENDistributionAgreeObj.d3voltageratio.decimalString
    else
       edtD3voltageratio.Text := ''; 



    if ( ENDistributionAgreeObj.d3totalratio <> nil ) then
       edtD3totalratio.Text := ENDistributionAgreeObj.d3totalratio.decimalString
    else
       edtD3totalratio.Text := ''; 



    MakeMultiline(edtD3place.Lines, ENDistributionAgreeObj.d3place);



    edtD3voltageclass.Text := ENDistributionAgreeObj.d3voltageclass; 



    edtD3workmode.Text := ENDistributionAgreeObj.d3workmode; 



    edtD3tarifftype.Text := ENDistributionAgreeObj.d3tarifftype; 



    edtD3accountingtype.Text := ENDistributionAgreeObj.d3accountingtype; 



    edtD5feederlist.Text := ENDistributionAgreeObj.d5feederlist; 



    edtD6reliabilitypue.Text := ENDistributionAgreeObj.d6reliabilitypue; 



    edtD6reliabilityguaranteed.Text := ENDistributionAgreeObj.d6reliabilityguaranteed; 



    MakeMultiline(edtD6balancesupplier.Lines, ENDistributionAgreeObj.d6balancesupplier);



    MakeMultiline(edtD6balanceclient.Lines, ENDistributionAgreeObj.d6balanceclient);



    MakeMultiline(edtD6responsibilitysupplier.Lines, ENDistributionAgreeObj.d6responsibilitysupplier);



    MakeMultiline(edtD6responsibilityclient.Lines, ENDistributionAgreeObj.d6responsibilityclient);



    MakeMultiline(edtD7linesource.Lines, ENDistributionAgreeObj.d7linesource);



    MakeMultiline(edtD7attachment.Lines, ENDistributionAgreeObj.d7attachment);



    MakeMultiline(edtD8conditions.Lines, ENDistributionAgreeObj.d8conditions);



    MakeMultiline(edtD8transformertype.Lines, ENDistributionAgreeObj.d8transformertype);



    if ( ENDistributionAgreeObj.d8voltagebh <> nil ) then
       edtD8voltagebh.Text := ENDistributionAgreeObj.d8voltagebh.decimalString
    else
       edtD8voltagebh.Text := ''; 



    if ( ENDistributionAgreeObj.d8voltagehh <> nil ) then
       edtD8voltagehh.Text := ENDistributionAgreeObj.d8voltagehh.decimalString
    else
       edtD8voltagehh.Text := ''; 



    if ( ENDistributionAgreeObj.d8lossesxx <> nil ) then
       edtD8lossesxx.Text := ENDistributionAgreeObj.d8lossesxx.decimalString
    else
       edtD8lossesxx.Text := ''; 



    if ( ENDistributionAgreeObj.d8losseskz <> nil ) then
       edtD8losseskz.Text := ENDistributionAgreeObj.d8losseskz.decimalString
    else
       edtD8losseskz.Text := ''; 



    if ( ENDistributionAgreeObj.d8amperage <> nil ) then
       edtD8amperage.Text := ENDistributionAgreeObj.d8amperage.decimalString
    else
       edtD8amperage.Text := ''; 



    if ( ENDistributionAgreeObj.d8voltagekz <> nil ) then
       edtD8voltagekz.Text := ENDistributionAgreeObj.d8voltagekz.decimalString
    else
       edtD8voltagekz.Text := ''; 



    if ( ENDistributionAgreeObj.d8linelength <> nil ) then
       edtD8linelength.Text := ENDistributionAgreeObj.d8linelength.decimalString
    else
       edtD8linelength.Text := ''; 



    if ( ENDistributionAgreeObj.d8liner <> nil ) then
       edtD8liner.Text := ENDistributionAgreeObj.d8liner.decimalString
    else
       edtD8liner.Text := ''; 



    if ( ENDistributionAgreeObj.d8linex <> nil ) then
       edtD8linex.Text := ENDistributionAgreeObj.d8linex.decimalString
    else
       edtD8linex.Text := ''; 



    if ( ENDistributionAgreeObj.d8hours <> Low(Integer) ) then
       edtD8hours.Text := IntToStr(ENDistributionAgreeObj.d8hours)
    else
       edtD8hours.Text := '';



    edtUserGen.Text := ENDistributionAgreeObj.userGen; 


  end;

}

end;



procedure TfrmENDistributionAgreeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDistributionAgreeFilterObj.eic := edtEic.Text; 



     ENDistributionAgreeFilterObj.objectname := edtObjectname.Text; 



     ENDistributionAgreeFilterObj.objectaddress := edtObjectaddress.Text; 



     if (ENDistributionAgreeFilterObj.power = nil ) then
       ENDistributionAgreeFilterObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENDistributionAgreeFilterObj.power.decimalString := edtPower.Text 
     else
       ENDistributionAgreeFilterObj.power := nil;




     ENDistributionAgreeFilterObj.d3countername := edtD3countername.Text; 



     ENDistributionAgreeFilterObj.d3countertype := edtD3countertype.Text; 



     if (ENDistributionAgreeFilterObj.d3amperageratio = nil ) then
       ENDistributionAgreeFilterObj.d3amperageratio := TXSDecimal.Create;
     if edtD3amperageratio.Text <> '' then
       ENDistributionAgreeFilterObj.d3amperageratio.decimalString := edtD3amperageratio.Text 
     else
       ENDistributionAgreeFilterObj.d3amperageratio := nil;




     if (ENDistributionAgreeFilterObj.d3voltageratio = nil ) then
       ENDistributionAgreeFilterObj.d3voltageratio := TXSDecimal.Create;
     if edtD3voltageratio.Text <> '' then
       ENDistributionAgreeFilterObj.d3voltageratio.decimalString := edtD3voltageratio.Text 
     else
       ENDistributionAgreeFilterObj.d3voltageratio := nil;




     if (ENDistributionAgreeFilterObj.d3totalratio = nil ) then
       ENDistributionAgreeFilterObj.d3totalratio := TXSDecimal.Create;
     if edtD3totalratio.Text <> '' then
       ENDistributionAgreeFilterObj.d3totalratio.decimalString := edtD3totalratio.Text 
     else
       ENDistributionAgreeFilterObj.d3totalratio := nil;




     ENDistributionAgreeFilterObj.d3place := edtD3place.Text; 



     ENDistributionAgreeFilterObj.d3voltageclass := edtD3voltageclass.Text; 



     ENDistributionAgreeFilterObj.d3workmode := edtD3workmode.Text; 



     ENDistributionAgreeFilterObj.d3tarifftype := edtD3tarifftype.Text; 



     ENDistributionAgreeFilterObj.d3accountingtype := edtD3accountingtype.Text; 



     ENDistributionAgreeFilterObj.d5feederlist := edtD5feederlist.Text; 



     ENDistributionAgreeFilterObj.d6reliabilitypue := edtD6reliabilitypue.Text; 



     ENDistributionAgreeFilterObj.d6reliabilityguaranteed := edtD6reliabilityguaranteed.Text; 



     ENDistributionAgreeFilterObj.d6balancesupplier := edtD6balancesupplier.Text; 



     ENDistributionAgreeFilterObj.d6balanceclient := edtD6balanceclient.Text; 



     ENDistributionAgreeFilterObj.d6responsibilitysupplier := edtD6responsibilitysupplier.Text; 



     ENDistributionAgreeFilterObj.d6responsibilityclient := edtD6responsibilityclient.Text; 



     ENDistributionAgreeFilterObj.d7linesource := edtD7linesource.Text; 



     ENDistributionAgreeFilterObj.d7attachment := edtD7attachment.Text; 



     ENDistributionAgreeFilterObj.d8conditions := edtD8conditions.Text; 



     ENDistributionAgreeFilterObj.d8transformertype := edtD8transformertype.Text; 



     if (ENDistributionAgreeFilterObj.d8voltagebh = nil ) then
       ENDistributionAgreeFilterObj.d8voltagebh := TXSDecimal.Create;
     if edtD8voltagebh.Text <> '' then
       ENDistributionAgreeFilterObj.d8voltagebh.decimalString := edtD8voltagebh.Text 
     else
       ENDistributionAgreeFilterObj.d8voltagebh := nil;




     if (ENDistributionAgreeFilterObj.d8voltagehh = nil ) then
       ENDistributionAgreeFilterObj.d8voltagehh := TXSDecimal.Create;
     if edtD8voltagehh.Text <> '' then
       ENDistributionAgreeFilterObj.d8voltagehh.decimalString := edtD8voltagehh.Text 
     else
       ENDistributionAgreeFilterObj.d8voltagehh := nil;




     if (ENDistributionAgreeFilterObj.d8lossesxx = nil ) then
       ENDistributionAgreeFilterObj.d8lossesxx := TXSDecimal.Create;
     if edtD8lossesxx.Text <> '' then
       ENDistributionAgreeFilterObj.d8lossesxx.decimalString := edtD8lossesxx.Text 
     else
       ENDistributionAgreeFilterObj.d8lossesxx := nil;




     if (ENDistributionAgreeFilterObj.d8losseskz = nil ) then
       ENDistributionAgreeFilterObj.d8losseskz := TXSDecimal.Create;
     if edtD8losseskz.Text <> '' then
       ENDistributionAgreeFilterObj.d8losseskz.decimalString := edtD8losseskz.Text 
     else
       ENDistributionAgreeFilterObj.d8losseskz := nil;




     if (ENDistributionAgreeFilterObj.d8amperage = nil ) then
       ENDistributionAgreeFilterObj.d8amperage := TXSDecimal.Create;
     if edtD8amperage.Text <> '' then
       ENDistributionAgreeFilterObj.d8amperage.decimalString := edtD8amperage.Text 
     else
       ENDistributionAgreeFilterObj.d8amperage := nil;




     if (ENDistributionAgreeFilterObj.d8voltagekz = nil ) then
       ENDistributionAgreeFilterObj.d8voltagekz := TXSDecimal.Create;
     if edtD8voltagekz.Text <> '' then
       ENDistributionAgreeFilterObj.d8voltagekz.decimalString := edtD8voltagekz.Text 
     else
       ENDistributionAgreeFilterObj.d8voltagekz := nil;




     if (ENDistributionAgreeFilterObj.d8linelength = nil ) then
       ENDistributionAgreeFilterObj.d8linelength := TXSDecimal.Create;
     if edtD8linelength.Text <> '' then
       ENDistributionAgreeFilterObj.d8linelength.decimalString := edtD8linelength.Text 
     else
       ENDistributionAgreeFilterObj.d8linelength := nil;




     if (ENDistributionAgreeFilterObj.d8liner = nil ) then
       ENDistributionAgreeFilterObj.d8liner := TXSDecimal.Create;
     if edtD8liner.Text <> '' then
       ENDistributionAgreeFilterObj.d8liner.decimalString := edtD8liner.Text 
     else
       ENDistributionAgreeFilterObj.d8liner := nil;




     if (ENDistributionAgreeFilterObj.d8linex = nil ) then
       ENDistributionAgreeFilterObj.d8linex := TXSDecimal.Create;
     if edtD8linex.Text <> '' then
       ENDistributionAgreeFilterObj.d8linex.decimalString := edtD8linex.Text 
     else
       ENDistributionAgreeFilterObj.d8linex := nil;




     if ( edtD8hours.Text <> '' ) then
       ENDistributionAgreeFilterObj.d8hours := StrToInt(edtD8hours.Text)
     else
       ENDistributionAgreeFilterObj.d8hours := Low(Integer) ;
	   



     ENDistributionAgreeFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.