
unit EditENActInvest2DFDocFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActInvest2DFDocController ;

type
  TfrmENActInvest2DFDocFilterEdit = class(TDialogForm)

    lblDfDocCode : TLabel;
    edtDfDocCode: TEdit;

    lblDfDocTypeCode : TLabel;
    edtDfDocTypeCode: TEdit;

    lblDfDocNumber : TLabel;
    edtDfDocNumber: TEdit;

    lblDfDocDate : TLabel;
    edtDfDocDate: TDateTimePicker;
    lblDfDocDescription : TLabel;
    edtDfDocDescription: TEdit;

    lblCommentgen : TLabel;
    edtCommentgen: TEdit;

    lblNecessary : TLabel;
    edtNecessary: TEdit;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENActInvest2DFDoc: THTTPRIO;

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
  frmENActInvest2DFDocFilterEdit: TfrmENActInvest2DFDocFilterEdit;
  ENActInvest2DFDocFilterObj: ENActInvest2DFDocFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActInvest2DFDocController  ;
}
{$R *.dfm}



procedure TfrmENActInvest2DFDocFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENActInvest2DFDocObj.dfDocCode <> Low(Integer) ) then
       edtDfDocCode.Text := IntToStr(ENActInvest2DFDocObj.dfDocCode)
    else
       edtDfDocCode.Text := '';



    if ( ENActInvest2DFDocObj.dfDocTypeCode <> Low(Integer) ) then
       edtDfDocTypeCode.Text := IntToStr(ENActInvest2DFDocObj.dfDocTypeCode)
    else
       edtDfDocTypeCode.Text := '';



    edtDfDocNumber.Text := ENActInvest2DFDocObj.dfDocNumber; 



      if ENActInvest2DFDocObj.dfDocDate <> nil then
      begin
        edtDfDocDate.DateTime:=EncodeDate(ENActInvest2DFDocObj.dfDocDate.Year,ENActInvest2DFDocObj.dfDocDate.Month,ENActInvest2DFDocObj.dfDocDate.Day);
        edtDfDocDate.checked := true;
      end
      else
      begin
        edtDfDocDate.DateTime:=SysUtils.Date;
        edtDfDocDate.checked := false;
      end;



    edtDfDocDescription.Text := ENActInvest2DFDocObj.dfDocDescription; 



    edtCommentgen.Text := ENActInvest2DFDocObj.commentgen; 



    if ( ENActInvest2DFDocObj.necessary <> Low(Integer) ) then
       edtNecessary.Text := IntToStr(ENActInvest2DFDocObj.necessary)
    else
       edtNecessary.Text := '';



    edtUserAdd.Text := ENActInvest2DFDocObj.userAdd; 



      if ENActInvest2DFDocObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENActInvest2DFDocObj.dateAdd.Year,ENActInvest2DFDocObj.dateAdd.Month,ENActInvest2DFDocObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENActInvest2DFDocObj.userGen; 



      if ENActInvest2DFDocObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENActInvest2DFDocObj.dateEdit.Year,ENActInvest2DFDocObj.dateEdit.Month,ENActInvest2DFDocObj.dateEdit.Day);
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



procedure TfrmENActInvest2DFDocFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtDfDocCode.Text <> '' ) then
       ENActInvest2DFDocFilterObj.dfDocCode := StrToInt(edtDfDocCode.Text)
     else
       ENActInvest2DFDocFilterObj.dfDocCode := Low(Integer) ;
	   



     if ( edtDfDocTypeCode.Text <> '' ) then
       ENActInvest2DFDocFilterObj.dfDocTypeCode := StrToInt(edtDfDocTypeCode.Text)
     else
       ENActInvest2DFDocFilterObj.dfDocTypeCode := Low(Integer) ;
	   



     ENActInvest2DFDocFilterObj.dfDocNumber := edtDfDocNumber.Text; 



     if edtdfDocDate.checked then
     begin 
       if ENActInvest2DFDocFilterObj.dfDocDate = nil then
          ENActInvest2DFDocFilterObj.dfDocDate := TXSDate.Create;
       ENActInvest2DFDocFilterObj.dfDocDate.XSToNative(GetXSDate(edtdfDocDate.DateTime));
     end
     else
       ENActInvest2DFDocFilterObj.dfDocDate := nil;



     ENActInvest2DFDocFilterObj.dfDocDescription := edtDfDocDescription.Text; 



     ENActInvest2DFDocFilterObj.commentgen := edtCommentgen.Text; 



     if ( edtNecessary.Text <> '' ) then
       ENActInvest2DFDocFilterObj.necessary := StrToInt(edtNecessary.Text)
     else
       ENActInvest2DFDocFilterObj.necessary := Low(Integer) ;
	   



     ENActInvest2DFDocFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENActInvest2DFDocFilterObj.dateAdd = nil then
          ENActInvest2DFDocFilterObj.dateAdd := TXSDateTime.Create;
       ENActInvest2DFDocFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENActInvest2DFDocFilterObj.dateAdd := nil;



     ENActInvest2DFDocFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENActInvest2DFDocFilterObj.dateEdit = nil then
          ENActInvest2DFDocFilterObj.dateEdit := TXSDateTime.Create;
       ENActInvest2DFDocFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENActInvest2DFDocFilterObj.dateEdit := nil;




  end;
end;




end.