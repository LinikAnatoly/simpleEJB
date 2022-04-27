
unit EditENPlanWorkReasonFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkReasonController ;

type
  TfrmENPlanWorkReasonFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblName : TLabel;
    edtName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  lblENManagementManagementName : TLabel;
  edtENManagementManagementName : TEdit;
  spbENManagementManagement : TSpeedButton;
  
  lblENPlanWorkReasonTypeReasonTypeName : TLabel;
  edtENPlanWorkReasonTypeReasonTypeName : TEdit;
  spbENPlanWorkReasonTypeReasonType : TSpeedButton;
  

  HTTPRIOENPlanWorkReason: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENManagementManagementClick(Sender : TObject);
  procedure spbENPlanWorkReasonTypeReasonTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanWorkReasonFilterEdit: TfrmENPlanWorkReasonFilterEdit;
  ENPlanWorkReasonFilterObj: ENPlanWorkReasonFilter;

implementation

uses
  ShowENManagement
  ,ENManagementController
  ,ShowENPlanWorkReasonType
  ,ENPlanWorkReasonTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkReasonFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      ,edtNumberGen
      ,edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanWorkReasonObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkReasonObj.dateGen.Year,ENPlanWorkReasonObj.dateGen.Month,ENPlanWorkReasonObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtNumberGen.Text := ENPlanWorkReasonObj.numberGen; 



    edtName.Text := ENPlanWorkReasonObj.name; 



    MakeMultiline(edtCommentGen.Lines, ENPlanWorkReasonObj.commentGen);



      if ENPlanWorkReasonObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkReasonObj.dateEdit.Year,ENPlanWorkReasonObj.dateEdit.Month,ENPlanWorkReasonObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := ENPlanWorkReasonObj.userGen; 


  end;

}

end;



procedure TfrmENPlanWorkReasonFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENPlanWorkReasonFilterObj.dateGen = nil then
          ENPlanWorkReasonFilterObj.dateGen := TXSDate.Create;
       ENPlanWorkReasonFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPlanWorkReasonFilterObj.dateGen := nil;



     ENPlanWorkReasonFilterObj.numberGen := edtNumberGen.Text; 



     ENPlanWorkReasonFilterObj.name := edtName.Text; 



     ENPlanWorkReasonFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPlanWorkReasonFilterObj.dateEdit = nil then
          ENPlanWorkReasonFilterObj.dateEdit := TXSDateTime.Create;
       ENPlanWorkReasonFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanWorkReasonFilterObj.dateEdit := nil;



     ENPlanWorkReasonFilterObj.userGen := edtUserGen.Text; 




  end;
end;

procedure TfrmENPlanWorkReasonFilterEdit.spbENManagementManagementClick(Sender : TObject);
var 
   frmENManagementShow: TfrmENManagementShow;
begin
   frmENManagementShow:=TfrmENManagementShow.Create(Application,fmNormal);
   try
      with frmENManagementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkReasonFilterObj.management = nil then ENPlanWorkReasonFilterObj.management := ENManagement.Create();
               ENPlanWorkReasonFilterObj.management.code := StrToInt(GetReturnValue(sgENManagement,0));
               edtENManagementManagementName.Text:=GetReturnValue(sgENManagement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManagementShow.Free;
   end;
end;


procedure TfrmENPlanWorkReasonFilterEdit.spbENPlanWorkReasonTypeReasonTypeClick(Sender : TObject);
var 
   frmENPlanWorkReasonTypeShow: TfrmENPlanWorkReasonTypeShow;
begin
   frmENPlanWorkReasonTypeShow:=TfrmENPlanWorkReasonTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkReasonTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkReasonFilterObj.reasonType = nil then ENPlanWorkReasonFilterObj.reasonType := ENPlanWorkReasonType.Create();
               ENPlanWorkReasonFilterObj.reasonType.code := StrToInt(GetReturnValue(sgENPlanWorkReasonType,0));
               edtENPlanWorkReasonTypeReasonTypeName.Text:=GetReturnValue(sgENPlanWorkReasonType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkReasonTypeShow.Free;
   end;
end;





end.