
unit EditENPlanWorkItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItemController ;

type
  TfrmENPlanWorkItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENPlanWorkItem: THTTPRIO;

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
  frmENPlanWorkItemFilterEdit: TfrmENPlanWorkItemFilterEdit;
  ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItemController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENPlanWorkItemObj.countGen <> nil ) then
       edtCountGen.Text := ENPlanWorkItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtCommentGen.Text := ENPlanWorkItemObj.commentGen; 



    edtUserGen.Text := ENPlanWorkItemObj.userGen; 



      if ENPlanWorkItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkItemObj.dateEdit.Year,ENPlanWorkItemObj.dateEdit.Month,ENPlanWorkItemObj.dateEdit.Day);
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



procedure TfrmENPlanWorkItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENPlanWorkItemFilterObj.countGen = nil ) then
       ENPlanWorkItemFilterObj.countGen := TXSDecimal.Create;
     ENPlanWorkItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     ENPlanWorkItemFilterObj.commentGen := edtCommentGen.Text; 



     ENPlanWorkItemFilterObj.userGen := edtUserGen.Text; 



     if ENPlanWorkItemFilterObj.dateEdit = nil then
        ENPlanWorkItemFilterObj.dateEdit := TXSDate.Create;
      ENPlanWorkItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;




end.