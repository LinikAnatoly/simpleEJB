
unit EditRQPlanPayFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayController ;

type
  TfrmRQPlanPayFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQPlanPay: THTTPRIO;

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
  frmRQPlanPayFilterEdit: TfrmRQPlanPayFilterEdit;
  RQPlanPayFilterObj: RQPlanPayFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := RQPlanPayObj.numberDoc; 



      if RQPlanPayObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQPlanPayObj.dateGen.Year,RQPlanPayObj.dateGen.Month,RQPlanPayObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtUserGen.Text := RQPlanPayObj.userGen; 



      if RQPlanPayObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPlanPayObj.dateEdit.Year,RQPlanPayObj.dateEdit.Month,RQPlanPayObj.dateEdit.Day);
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



procedure TfrmRQPlanPayFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPlanPayFilterObj.numberDoc := edtNumberDoc.Text; 



     if edtdateGen.checked then
     begin 
       if RQPlanPayFilterObj.dateGen = nil then
          RQPlanPayFilterObj.dateGen := TXSDate.Create;
       RQPlanPayFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQPlanPayFilterObj.dateGen := nil;



     RQPlanPayFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQPlanPayFilterObj.dateEdit = nil then
          RQPlanPayFilterObj.dateEdit := TXSDateTime.Create;
       RQPlanPayFilterObj.dateEdit.XSToNative(GetXSDateTime(edtdateEdit.DateTime));
     end
     else
       RQPlanPayFilterObj.dateEdit := nil;


  end;
end;




end.