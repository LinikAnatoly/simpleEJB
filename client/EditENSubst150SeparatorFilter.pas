
unit EditENSubst150SeparatorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150SeparatorController ;

type
  TfrmENSubst150SeparatorFilterEdit = class(TDialogForm)

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
  

  HTTPRIOENSubst150Separator: THTTPRIO;

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
  frmENSubst150SeparatorFilterEdit: TfrmENSubst150SeparatorFilterEdit;
  ENSubst150SeparatorFilterObj: ENSubst150SeparatorFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150SeparatorController  ;
}
{$R *.dfm}



procedure TfrmENSubst150SeparatorFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150SeparatorObj.name; 



    edtFactoryNumber.Text := ENSubst150SeparatorObj.factoryNumber; 



    if ( ENSubst150SeparatorObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150SeparatorObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150SeparatorObj.commentGen);



    edtUserGen.Text := ENSubst150SeparatorObj.userGen; 



      if ENSubst150SeparatorObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150SeparatorObj.dateEdit.Year,ENSubst150SeparatorObj.dateEdit.Month,ENSubst150SeparatorObj.dateEdit.Day);
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



procedure TfrmENSubst150SeparatorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150SeparatorFilterObj.name := edtName.Text; 



     ENSubst150SeparatorFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150SeparatorFilterObj.currentNominal = nil ) then
       ENSubst150SeparatorFilterObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150SeparatorFilterObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150SeparatorFilterObj.currentNominal := nil;




     ENSubst150SeparatorFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150SeparatorFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150SeparatorFilterObj.dateEdit = nil then
          ENSubst150SeparatorFilterObj.dateEdit := TXSDate.Create;
       ENSubst150SeparatorFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150SeparatorFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150SeparatorFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150SeparatorFilterObj.element = nil then ENSubst150SeparatorFilterObj.element := ENElement.Create();
               ENSubst150SeparatorFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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