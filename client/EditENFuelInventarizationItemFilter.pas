
unit EditENFuelInventarizationItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationItemController ;

type
  TfrmENFuelInventarizationItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblCountFact : TLabel;
    edtCountFact: TEdit;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelInventarizationItem: THTTPRIO;

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
  frmENFuelInventarizationItemFilterEdit: TfrmENFuelInventarizationItemFilterEdit;
  ENFuelInventarizationItemFilterObj: ENFuelInventarizationItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationItemController  ;
}
{$R *.dfm}



procedure TfrmENFuelInventarizationItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENFuelInventarizationItemObj.countGen <> nil ) then
       edtCountGen.Text := ENFuelInventarizationItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENFuelInventarizationItemObj.countFact <> nil ) then
       edtCountFact.Text := ENFuelInventarizationItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    edtUserAdd.Text := ENFuelInventarizationItemObj.userAdd; 



      if ENFuelInventarizationItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENFuelInventarizationItemObj.dateAdd.Year,ENFuelInventarizationItemObj.dateAdd.Month,ENFuelInventarizationItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENFuelInventarizationItemObj.userGen; 



      if ENFuelInventarizationItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelInventarizationItemObj.dateEdit.Year,ENFuelInventarizationItemObj.dateEdit.Month,ENFuelInventarizationItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENFuelInventarizationItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENFuelInventarizationItemFilterObj.countGen = nil ) then
       ENFuelInventarizationItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENFuelInventarizationItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENFuelInventarizationItemFilterObj.countGen := nil;




     if (ENFuelInventarizationItemFilterObj.countFact = nil ) then
       ENFuelInventarizationItemFilterObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENFuelInventarizationItemFilterObj.countFact.decimalString := edtCountFact.Text 
     else
       ENFuelInventarizationItemFilterObj.countFact := nil;




     ENFuelInventarizationItemFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENFuelInventarizationItemFilterObj.dateAdd = nil then
          ENFuelInventarizationItemFilterObj.dateAdd := TXSDateTime.Create;
       ENFuelInventarizationItemFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENFuelInventarizationItemFilterObj.dateAdd := nil;



     ENFuelInventarizationItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelInventarizationItemFilterObj.dateEdit = nil then
          ENFuelInventarizationItemFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelInventarizationItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelInventarizationItemFilterObj.dateEdit := nil;




  end;
end;




end.