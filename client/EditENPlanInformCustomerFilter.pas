
unit EditENPlanInformCustomerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanInformCustomerController ;

type
  TfrmENPlanInformCustomerFilterEdit = class(TDialogForm)

    lblTimeStart : TLabel;
    edtTimeStart: TDateTimePicker;
    lblTimeFinal : TLabel;
    edtTimeFinal: TDateTimePicker;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblIsSent : TLabel;
    edtIsSent: TEdit;



  HTTPRIOENPlanInformCustomer: THTTPRIO;

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
  frmENPlanInformCustomerFilterEdit: TfrmENPlanInformCustomerFilterEdit;
  ENPlanInformCustomerFilterObj: ENPlanInformCustomerFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanInformCustomerController  ;
}
{$R *.dfm}



procedure TfrmENPlanInformCustomerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
      ,edtIsSent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanInformCustomerObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:=EncodeDate(ENPlanInformCustomerObj.timeStart.Year,ENPlanInformCustomerObj.timeStart.Month,ENPlanInformCustomerObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;	  



      if ENPlanInformCustomerObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:=EncodeDate(ENPlanInformCustomerObj.timeFinal.Year,ENPlanInformCustomerObj.timeFinal.Month,ENPlanInformCustomerObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;	  



    edtUserAdd.Text := ENPlanInformCustomerObj.userAdd; 



      if ENPlanInformCustomerObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENPlanInformCustomerObj.dateAdd.Year,ENPlanInformCustomerObj.dateAdd.Month,ENPlanInformCustomerObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENPlanInformCustomerObj.userGen; 



      if ENPlanInformCustomerObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanInformCustomerObj.dateEdit.Year,ENPlanInformCustomerObj.dateEdit.Month,ENPlanInformCustomerObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    if ( ENPlanInformCustomerObj.isSent <> Low(Integer) ) then
       edtIsSent.Text := IntToStr(ENPlanInformCustomerObj.isSent)
    else
       edtIsSent.Text := '';


  end;

}

end;



procedure TfrmENPlanInformCustomerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanInformCustomer: ENPlanInformCustomerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edttimeStart.checked then
     begin 
       if ENPlanInformCustomerFilterObj.timeStart = nil then
          ENPlanInformCustomerFilterObj.timeStart := TXSDateTime.Create;
       ENPlanInformCustomerFilterObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENPlanInformCustomerFilterObj.timeStart := nil;



     if edttimeFinal.checked then
     begin 
       if ENPlanInformCustomerFilterObj.timeFinal = nil then
          ENPlanInformCustomerFilterObj.timeFinal := TXSDateTime.Create;
       ENPlanInformCustomerFilterObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENPlanInformCustomerFilterObj.timeFinal := nil;



     ENPlanInformCustomerFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENPlanInformCustomerFilterObj.dateAdd = nil then
          ENPlanInformCustomerFilterObj.dateAdd := TXSDateTime.Create;
       ENPlanInformCustomerFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENPlanInformCustomerFilterObj.dateAdd := nil;



     ENPlanInformCustomerFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPlanInformCustomerFilterObj.dateEdit = nil then
          ENPlanInformCustomerFilterObj.dateEdit := TXSDateTime.Create;
       ENPlanInformCustomerFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanInformCustomerFilterObj.dateEdit := nil;



     if ( edtIsSent.Text <> '' ) then
       ENPlanInformCustomerFilterObj.isSent := StrToInt(edtIsSent.Text)
     else
       ENPlanInformCustomerFilterObj.isSent := Low(Integer) ;





  end;
end;




end.