
unit EditCNPack2PlanWorkFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, CNPack2PlanWorkController ;

type
  TfrmCNPack2PlanWorkFilterEdit = class(TDialogForm)

    lblPackCode : TLabel;
    edtPackCode: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOCNPack2PlanWork: THTTPRIO;

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
  frmCNPack2PlanWorkFilterEdit: TfrmCNPack2PlanWorkFilterEdit;
  CNPack2PlanWorkFilterObj: CNPack2PlanWorkFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, CNPack2PlanWorkController  ;
}
{$R *.dfm}



procedure TfrmCNPack2PlanWorkFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPackCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( CNPack2PlanWorkObj.packCode <> Low(Integer) ) then
       edtPackCode.Text := IntToStr(CNPack2PlanWorkObj.packCode)
    else
       edtPackCode.Text := '';



    edtCommentGen.Text := CNPack2PlanWorkObj.commentGen; 



    edtUserGen.Text := CNPack2PlanWorkObj.userGen; 



      if CNPack2PlanWorkObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(CNPack2PlanWorkObj.dateEdit.Year,CNPack2PlanWorkObj.dateEdit.Month,CNPack2PlanWorkObj.dateEdit.Day);
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



procedure TfrmCNPack2PlanWorkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtPackCode.Text <> '' ) then
       CNPack2PlanWorkFilterObj.packCode := StrToInt(edtPackCode.Text)
     else
       CNPack2PlanWorkFilterObj.packCode := Low(Integer) ;




     CNPack2PlanWorkFilterObj.commentGen := edtCommentGen.Text; 



     CNPack2PlanWorkFilterObj.userGen := edtUserGen.Text; 



     if CNPack2PlanWorkFilterObj.dateEdit = nil then
        CNPack2PlanWorkFilterObj.dateEdit := TXSDate.Create;
      CNPack2PlanWorkFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;




end.