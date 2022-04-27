
unit EditENActPostingKindItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActPostingKindItemController ;

type
  TfrmENActPostingKindItemFilterEdit = class(TDialogForm)

    lblCehKt : TLabel;
    edtCehKt: TEdit;

    lblAccountKt : TLabel;
    edtAccountKt: TEdit;

    lblKauKt : TLabel;
    edtKauKt: TEdit;

    lblCehDt : TLabel;
    edtCehDt: TEdit;

    lblAccountDt : TLabel;
    edtAccountDt: TEdit;

    lblKauDt : TLabel;
    edtKauDt: TEdit;

    lblSummaGen : TLabel;
    edtSummaGen: TEdit;

    lblPlusMinus : TLabel;
    edtPlusMinus: TEdit;

    lblDescription : TLabel;
    edtDescription: TMemo;


  lblENActPostingKindENActPostingKindName : TLabel;
  edtENActPostingKindENActPostingKindName : TEdit;
  spbENActPostingKindENActPostingKind : TSpeedButton;
  
  lblENActPostingTypeSumENActPostingTypeSumName : TLabel;
  edtENActPostingTypeSumENActPostingTypeSumName : TEdit;
  spbENActPostingTypeSumENActPostingTypeSum : TSpeedButton;
  
  lblENActPostingFormENActPostingFormName : TLabel;
  edtENActPostingFormENActPostingFormName : TEdit;
  spbENActPostingFormENActPostingForm : TSpeedButton;
  

  HTTPRIOENActPostingKindItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENActPostingKindENActPostingKindClick(Sender : TObject);
  procedure spbENActPostingTypeSumENActPostingTypeSumClick(Sender : TObject);
  procedure spbENActPostingFormENActPostingFormClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENActPostingKindItemFilterEdit: TfrmENActPostingKindItemFilterEdit;
  ENActPostingKindItemFilterObj: ENActPostingKindItemFilter;

implementation

uses
  ShowENActPostingKind
  ,ENActPostingKindController
  ,ShowENActPostingTypeSum
  ,ENActPostingTypeSumController
  ,ShowENActPostingForm
  ,ENActPostingFormController
;

{uses  
    EnergyproController, EnergyproController2, ENActPostingKindItemController  ;
}
{$R *.dfm}



procedure TfrmENActPostingKindItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCehKt
      ,edtAccountKt
      ,edtKauKt
      ,edtCehDt
      ,edtAccountDt
      ,edtKauDt
      ,edtPlusMinus
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCehKt.Text := ENActPostingKindItemObj.cehKt; 



    edtAccountKt.Text := ENActPostingKindItemObj.accountKt; 



    edtKauKt.Text := ENActPostingKindItemObj.kauKt; 



    edtCehDt.Text := ENActPostingKindItemObj.cehDt; 



    edtAccountDt.Text := ENActPostingKindItemObj.accountDt; 



    edtKauDt.Text := ENActPostingKindItemObj.kauDt; 



    if ( ENActPostingKindItemObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActPostingKindItemObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 



    edtPlusMinus.Text := ENActPostingKindItemObj.plusMinus; 



    MakeMultiline(edtDescription.Lines, ENActPostingKindItemObj.description);


  end;

}

end;



procedure TfrmENActPostingKindItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActPostingKindItemFilterObj.cehKt := edtCehKt.Text; 



     ENActPostingKindItemFilterObj.accountKt := edtAccountKt.Text; 



     ENActPostingKindItemFilterObj.kauKt := edtKauKt.Text; 



     ENActPostingKindItemFilterObj.cehDt := edtCehDt.Text; 



     ENActPostingKindItemFilterObj.accountDt := edtAccountDt.Text; 



     ENActPostingKindItemFilterObj.kauDt := edtKauDt.Text; 



     if (ENActPostingKindItemFilterObj.summaGen = nil ) then
       ENActPostingKindItemFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActPostingKindItemFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActPostingKindItemFilterObj.summaGen := nil;




     ENActPostingKindItemFilterObj.plusMinus := edtPlusMinus.Text; 



     ENActPostingKindItemFilterObj.description := edtDescription.Text; 




  end;
end;

procedure TfrmENActPostingKindItemFilterEdit.spbENActPostingKindENActPostingKindClick(Sender : TObject);
var 
   frmENActPostingKindShow: TfrmENActPostingKindShow;
begin
   frmENActPostingKindShow:=TfrmENActPostingKindShow.Create(Application,fmNormal);
   try
      with frmENActPostingKindShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemFilterObj.ENActPostingKind = nil then ENActPostingKindItemFilterObj.ENActPostingKind := ENActPostingKind.Create();
               ENActPostingKindItemFilterObj.ENActPostingKind.code := StrToInt(GetReturnValue(sgENActPostingKind,0));
               edtENActPostingKindENActPostingKindName.Text:=GetReturnValue(sgENActPostingKind,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActPostingKindShow.Free;
   end;
end;


procedure TfrmENActPostingKindItemFilterEdit.spbENActPostingTypeSumENActPostingTypeSumClick(Sender : TObject);
var 
   frmENActPostingTypeSumShow: TfrmENActPostingTypeSumShow;
begin
   frmENActPostingTypeSumShow:=TfrmENActPostingTypeSumShow.Create(Application,fmNormal);
   try
      with frmENActPostingTypeSumShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemFilterObj.ENActPostingTypeSum = nil then ENActPostingKindItemFilterObj.ENActPostingTypeSum := ENActPostingTypeSum.Create();
               ENActPostingKindItemFilterObj.ENActPostingTypeSum.code := StrToInt(GetReturnValue(sgENActPostingTypeSum,0));
               edtENActPostingTypeSumENActPostingTypeSumName.Text:=GetReturnValue(sgENActPostingTypeSum,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActPostingTypeSumShow.Free;
   end;
end;


procedure TfrmENActPostingKindItemFilterEdit.spbENActPostingFormENActPostingFormClick(Sender : TObject);
var 
   frmENActPostingFormShow: TfrmENActPostingFormShow;
begin
   frmENActPostingFormShow:=TfrmENActPostingFormShow.Create(Application,fmNormal);
   try
      with frmENActPostingFormShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemFilterObj.ENActPostingForm = nil then ENActPostingKindItemFilterObj.ENActPostingForm := ENActPostingForm.Create();
               ENActPostingKindItemFilterObj.ENActPostingForm.code := StrToInt(GetReturnValue(sgENActPostingForm,0));
               edtENActPostingFormENActPostingFormName.Text:=GetReturnValue(sgENActPostingForm,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActPostingFormShow.Free;
   end;
end;





end.