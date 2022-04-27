
unit EditENEstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemController ;

type
  TfrmENEstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENEstimateItem: THTTPRIO;

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
  frmENEstimateItemFilterEdit: TfrmENEstimateItemFilterEdit;
  ENEstimateItemFilterObj: ENEstimateItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    if ( ENEstimateItemObj.countFact <> nil ) then
       edtCountFact.Text := ENEstimateItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    edtCommentGen.Text := ENEstimateItemObj.commentGen; 



    edtUserGen.Text := ENEstimateItemObj.userGen; 



      if ENEstimateItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENEstimateItemObj.dateEdit.Year,ENEstimateItemObj.dateEdit.Month,ENEstimateItemObj.dateEdit.Day);
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



procedure TfrmENEstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENEstimateItemFilterObj.countGen = nil ) then
       ENEstimateItemFilterObj.countGen := TXSDecimal.Create;
     ENEstimateItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     if (ENEstimateItemFilterObj.countFact = nil ) then
       ENEstimateItemFilterObj.countFact := TXSDecimal.Create;
     ENEstimateItemFilterObj.countFact.decimalString := edtCountFact.Text ;



     ENEstimateItemFilterObj.commentGen := edtCommentGen.Text; 



     ENEstimateItemFilterObj.userGen := edtUserGen.Text; 



     if ENEstimateItemFilterObj.dateEdit = nil then
        ENEstimateItemFilterObj.dateEdit := TXSDate.Create;
      ENEstimateItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;




end.