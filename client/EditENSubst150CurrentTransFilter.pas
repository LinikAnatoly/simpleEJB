
unit EditENSubst150CurrentTransFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150CurrentTransController ;

type
  TfrmENSubst150CurrentTransFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblCurrentNominal : TLabel;
    edtCurrentNominal: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150CurrentTrans: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150CurrentTransFilterEdit: TfrmENSubst150CurrentTransFilterEdit;
  ENSubst150CurrentTransFilterObj: ENSubst150CurrentTransFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150CurrentTransController  ;
}
{$R *.dfm}



procedure TfrmENSubst150CurrentTransFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSubst150CurrentTransObj.name; 



    edtFactoryNumber.Text := ENSubst150CurrentTransObj.factoryNumber; 



    if ( ENSubst150CurrentTransObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150CurrentTransObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150CurrentTransObj.commentGen);



    edtUserGen.Text := ENSubst150CurrentTransObj.userGen; 



      if ENSubst150CurrentTransObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150CurrentTransObj.dateEdit.Year,ENSubst150CurrentTransObj.dateEdit.Month,ENSubst150CurrentTransObj.dateEdit.Day);
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



procedure TfrmENSubst150CurrentTransFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150CurrentTrans: ENSubst150CurrentTransControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150CurrentTransFilterObj.name := edtName.Text; 



     ENSubst150CurrentTransFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150CurrentTransFilterObj.currentNominal = nil ) then
       ENSubst150CurrentTransFilterObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150CurrentTransFilterObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150CurrentTransFilterObj.currentNominal := nil;




     ENSubst150CurrentTransFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150CurrentTransFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150CurrentTransFilterObj.dateEdit = nil then
          ENSubst150CurrentTransFilterObj.dateEdit := TXSDate.Create;
       ENSubst150CurrentTransFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150CurrentTransFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150CurrentTransFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150CurrentTransFilterObj.element = nil then ENSubst150CurrentTransFilterObj.element := ENElement.Create();
               ENSubst150CurrentTransFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.