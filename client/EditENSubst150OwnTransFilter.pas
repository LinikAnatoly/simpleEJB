
unit EditENSubst150OwnTransFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150OwnTransController ;

type
  TfrmENSubst150OwnTransFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblPower : TLabel;
    edtPower: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150OwnTrans: THTTPRIO;

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
  frmENSubst150OwnTransFilterEdit: TfrmENSubst150OwnTransFilterEdit;
  ENSubst150OwnTransFilterObj: ENSubst150OwnTransFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150OwnTransController  ;
}
{$R *.dfm}



procedure TfrmENSubst150OwnTransFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150OwnTransObj.name; 



    edtFactoryNumber.Text := ENSubst150OwnTransObj.factoryNumber; 



    if ( ENSubst150OwnTransObj.power <> nil ) then
       edtPower.Text := ENSubst150OwnTransObj.power.decimalString
    else
       edtPower.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150OwnTransObj.commentGen);



    edtUserGen.Text := ENSubst150OwnTransObj.userGen; 



      if ENSubst150OwnTransObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150OwnTransObj.dateEdit.Year,ENSubst150OwnTransObj.dateEdit.Month,ENSubst150OwnTransObj.dateEdit.Day);
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



procedure TfrmENSubst150OwnTransFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150OwnTrans: ENSubst150OwnTransControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150OwnTransFilterObj.name := edtName.Text; 



     ENSubst150OwnTransFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150OwnTransFilterObj.power = nil ) then
       ENSubst150OwnTransFilterObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENSubst150OwnTransFilterObj.power.decimalString := edtPower.Text 
     else
       ENSubst150OwnTransFilterObj.power := nil;




     ENSubst150OwnTransFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150OwnTransFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150OwnTransFilterObj.dateEdit = nil then
          ENSubst150OwnTransFilterObj.dateEdit := TXSDate.Create;
       ENSubst150OwnTransFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150OwnTransFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150OwnTransFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150OwnTransFilterObj.element = nil then ENSubst150OwnTransFilterObj.element := ENElement.Create();
               ENSubst150OwnTransFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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