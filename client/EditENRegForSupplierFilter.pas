
unit EditENRegForSupplierFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierController ;

type
  TfrmENRegForSupplierFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateFrom : TLabel;
    edtDateFrom: TDateTimePicker;
    lblDateTo : TLabel;
    edtDateTo: TDateTimePicker;
    lblSupplierCode : TLabel;
    edtSupplierCode: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENRegForSupplier: THTTPRIO;

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
  frmENRegForSupplierFilterEdit: TfrmENRegForSupplierFilterEdit;
  ENRegForSupplierFilterObj: ENRegForSupplierFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateFrom
      ,edtDateTo
      ,edtSupplierCode
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENRegForSupplierObj.numberGen; 



      if ENRegForSupplierObj.dateFrom <> nil then
      begin
        edtDateFrom.DateTime:=EncodeDate(ENRegForSupplierObj.dateFrom.Year,ENRegForSupplierObj.dateFrom.Month,ENRegForSupplierObj.dateFrom.Day);
        edtDateFrom.checked := true;
      end
      else
      begin
        edtDateFrom.DateTime:=SysUtils.Date;
        edtDateFrom.checked := false;
      end;



      if ENRegForSupplierObj.dateTo <> nil then
      begin
        edtDateTo.DateTime:=EncodeDate(ENRegForSupplierObj.dateTo.Year,ENRegForSupplierObj.dateTo.Month,ENRegForSupplierObj.dateTo.Day);
        edtDateTo.checked := true;
      end
      else
      begin
        edtDateTo.DateTime:=SysUtils.Date;
        edtDateTo.checked := false;
      end;



    if ( ENRegForSupplierObj.supplierCode <> Low(Integer) ) then
       edtSupplierCode.Text := IntToStr(ENRegForSupplierObj.supplierCode)
    else
       edtSupplierCode.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENRegForSupplierObj.commentGen);



    edtUserAdd.Text := ENRegForSupplierObj.userAdd; 



      if ENRegForSupplierObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENRegForSupplierObj.dateAdd.Year,ENRegForSupplierObj.dateAdd.Month,ENRegForSupplierObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENRegForSupplierObj.userGen; 



      if ENRegForSupplierObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENRegForSupplierObj.dateEdit.Year,ENRegForSupplierObj.dateEdit.Month,ENRegForSupplierObj.dateEdit.Day);
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



procedure TfrmENRegForSupplierFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRegForSupplierFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateFrom.checked then
     begin 
       if ENRegForSupplierFilterObj.dateFrom = nil then
          ENRegForSupplierFilterObj.dateFrom := TXSDate.Create;
       ENRegForSupplierFilterObj.dateFrom.XSToNative(GetXSDate(edtdateFrom.DateTime));
     end
     else
       ENRegForSupplierFilterObj.dateFrom := nil;



     if edtdateTo.checked then
     begin 
       if ENRegForSupplierFilterObj.dateTo = nil then
          ENRegForSupplierFilterObj.dateTo := TXSDate.Create;
       ENRegForSupplierFilterObj.dateTo.XSToNative(GetXSDate(edtdateTo.DateTime));
     end
     else
       ENRegForSupplierFilterObj.dateTo := nil;



     if ( edtSupplierCode.Text <> '' ) then
       ENRegForSupplierFilterObj.supplierCode := StrToInt(edtSupplierCode.Text)
     else
       ENRegForSupplierFilterObj.supplierCode := Low(Integer) ;
	   



     ENRegForSupplierFilterObj.commentGen := edtCommentGen.Text; 



     ENRegForSupplierFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENRegForSupplierFilterObj.dateAdd = nil then
          ENRegForSupplierFilterObj.dateAdd := TXSDateTime.Create;
       ENRegForSupplierFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENRegForSupplierFilterObj.dateAdd := nil;



     ENRegForSupplierFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENRegForSupplierFilterObj.dateEdit = nil then
          ENRegForSupplierFilterObj.dateEdit := TXSDateTime.Create;
       ENRegForSupplierFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENRegForSupplierFilterObj.dateEdit := nil;




  end;
end;




end.