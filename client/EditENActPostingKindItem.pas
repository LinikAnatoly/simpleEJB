unit EditENActPostingKindItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActPostingKindItemController ;

type
  TfrmENActPostingKindItemEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
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
    ActionList: TActionList;
    actSelectSpecCharacters: TAction;
    PopupMenu: TPopupMenu;
    miSelectSpecCharacters: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENActPostingKindENActPostingKindClick(Sender : TObject);
  procedure spbENActPostingTypeSumENActPostingTypeSumClick(Sender : TObject);
  procedure spbENActPostingFormENActPostingFormClick(Sender : TObject);
    procedure edtPlusMinusKeyPress(Sender: TObject; var Key: Char);
    procedure edtCehKtKeyPress(Sender: TObject; var Key: Char);
    procedure edtAccountKtKeyPress(Sender: TObject; var Key: Char);
    procedure edtKauKtKeyPress(Sender: TObject; var Key: Char);
    procedure edtCehDtKeyPress(Sender: TObject; var Key: Char);
    procedure edtAccountDtKeyPress(Sender: TObject; var Key: Char);
    procedure edtKauDtKeyPress(Sender: TObject; var Key: Char);
    procedure actSelectSpecCharactersExecute(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENActPostingKindItemEdit: TfrmENActPostingKindItemEdit;
  ENActPostingKindItemObj: ENActPostingKindItem;

implementation

uses
  ShowENActPostingKind
  ,ENActPostingKindController
  ,ShowENActPostingTypeSum
  ,ENActPostingTypeSumController
  ,ShowENActPostingForm
  ,ENActPostingFormController
  ,ENActPostingSpecCharactersController, ShowENActPostingSpecCharacters;


{$R *.dfm}

procedure TfrmENActPostingKindItemEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode,
  edtENActPostingTypeSumENActPostingTypeSumName ,
  edtENActPostingKindENActPostingKindName,
  edtENActPostingFormENActPostingFormName ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENActPostingKindENActPostingKindName
      ,spbENActPostingKindENActPostingKind
      ,edtENActPostingTypeSumENActPostingTypeSumName
      ,spbENActPostingTypeSumENActPostingTypeSum
      ,edtENActPostingFormENActPostingFormName
      ,spbENActPostingFormENActPostingForm
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

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

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENActPostingKindItemObj.code);
    edtCehKt.Text := ENActPostingKindItemObj.cehKt; 
    edtAccountKt.Text := ENActPostingKindItemObj.accountKt; 
    edtKauKt.Text := ENActPostingKindItemObj.kauKt; 
    edtCehDt.Text := ENActPostingKindItemObj.cehDt; 
    edtAccountDt.Text := ENActPostingKindItemObj.accountDt; 
    edtKauDt.Text := ENActPostingKindItemObj.kauDt; 
    SetTXSDecimalForTEdit(edtSummaGen, ENActPostingKindItemObj.summaGen);
    edtPlusMinus.Text := ENActPostingKindItemObj.plusMinus; 
    MakeMultiline(edtDescription.Lines, ENActPostingKindItemObj.description);

    edtENActPostingKindENActPostingKindName.Text := ENActPostingKindItemObj.ENActPostingKind.name;
    edtENActPostingTypeSumENActPostingTypeSumName.Text := ENActPostingKindItemObj.ENActPostingTypeSum.name;
    edtENActPostingFormENActPostingFormName.Text := ENActPostingKindItemObj.ENActPostingForm.name;
  end;
end;



procedure TfrmENActPostingKindItemEdit.actSelectSpecCharactersExecute(
  Sender: TObject);
var
   frmENActPostingSpecCharactersShow: TfrmENActPostingSpecCharactersShow;
   Comp : TComponent;
   compEdit : Tedit;
begin

   Comp := ActiveControl;
   frmENActPostingSpecCharactersShow:=TfrmENActPostingSpecCharactersShow.Create(Application,fmNormal);
   try
      with frmENActPostingSpecCharactersShow do
        if ShowModal = mrOk then
        begin
              
//              if Comp.Name = edtCehKt.Name then
//              begin  
                compEdit:= TEdit(Comp);
                compEdit.Text := compEdit.Text + GetReturnValue(sgENActPostingSpecCharacters,1);
                compEdit.SelStart :=  Length(compEdit.Text);

            //  end;
          
        end;
   finally
      frmENActPostingKindShow.Free;
   end;
end;

procedure TfrmENActPostingKindItemEdit.edtAccountDtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if ( (Length(
    StringReplace(StringReplace(edtAccountDt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
    ) > 3) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtAccountKtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( (Length(
   StringReplace(StringReplace(edtAccountKt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
   ) > 3) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtCehDtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if ( (Length(
    StringReplace(StringReplace(edtcehDt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
    ) > 2) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtCehKtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( (Length(
     StringReplace(StringReplace(edtCehKt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
   ) > 2) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtKauDtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( (Length(
   StringReplace(StringReplace(edtKauDt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
   ) > 10) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtKauKtKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( (Length(
   StringReplace(StringReplace(edtKauKt.Text, '[', '',[rfReplaceAll, rfIgnoreCase]), ']', '',[rfReplaceAll, rfIgnoreCase])
   ) > 10) and (Key <> #8) )
    then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.edtPlusMinusKeyPress(Sender: TObject;
  var Key: Char);
  var chars : set of char;
begin
  inherited;
   chars := ['+' , '-' , #8 ];
   if ( not (Key in chars) or
     (( Length(edtPlusMinus.Text) > 0) and (Key <> #8) ) ) then Key := #0;
end;

procedure TfrmENActPostingKindItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCehKt
      ,edtAccountKt
      ,edtKauKt
      ,edtCehDt
      ,edtAccountDt
      ,edtKauDt
      ,edtPlusMinus
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;

    ENActPostingKindItemObj.cehKt := edtCehKt.Text; 
    ENActPostingKindItemObj.accountKt := edtAccountKt.Text; 
    ENActPostingKindItemObj.kauKt := edtKauKt.Text; 
    ENActPostingKindItemObj.cehDt := edtCehDt.Text; 
    ENActPostingKindItemObj.accountDt := edtAccountDt.Text; 
    ENActPostingKindItemObj.kauDt := edtKauDt.Text; 
    ENActPostingKindItemObj.summaGen := GetTXSDecimalFromTEdit(edtSummaGen);
    ENActPostingKindItemObj.plusMinus := edtPlusMinus.Text; 
    ENActPostingKindItemObj.description := edtDescription.Text; 

    if DialogState = dsInsert then
    begin
      ENActPostingKindItemObj.code := Low(Integer);
      TempENActPostingKindItem.add(ENActPostingKindItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActPostingKindItem.save(ENActPostingKindItemObj);
    end;
  end;
end;


procedure TfrmENActPostingKindItemEdit.spbENActPostingKindENActPostingKindClick(Sender : TObject);
var
   frmENActPostingKindShow: TfrmENActPostingKindShow;
begin
   frmENActPostingKindShow:=TfrmENActPostingKindShow.Create(Application,fmNormal);
   try
      with frmENActPostingKindShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemObj.ENActPostingKind = nil then ENActPostingKindItemObj.ENActPostingKind := ENActPostingKind.Create();
               ENActPostingKindItemObj.ENActPostingKind.code := StrToInt(GetReturnValue(sgENActPostingKind,0));
               edtENActPostingKindENActPostingKindName.Text:=GetReturnValue(sgENActPostingKind,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActPostingKindShow.Free;
   end;
end;


procedure TfrmENActPostingKindItemEdit.spbENActPostingTypeSumENActPostingTypeSumClick(Sender : TObject);
var 
   frmENActPostingTypeSumShow: TfrmENActPostingTypeSumShow;
begin
   frmENActPostingTypeSumShow:=TfrmENActPostingTypeSumShow.Create(Application,fmNormal);
   try
      with frmENActPostingTypeSumShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemObj.ENActPostingTypeSum = nil then ENActPostingKindItemObj.ENActPostingTypeSum := ENActPostingTypeSum.Create();
               ENActPostingKindItemObj.ENActPostingTypeSum.code := StrToInt(GetReturnValue(sgENActPostingTypeSum,0));
               edtENActPostingTypeSumENActPostingTypeSumName.Text:=GetReturnValue(sgENActPostingTypeSum,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActPostingTypeSumShow.Free;
   end;
end;


procedure TfrmENActPostingKindItemEdit.spbENActPostingFormENActPostingFormClick(Sender : TObject);
var 
   frmENActPostingFormShow: TfrmENActPostingFormShow;
begin
   frmENActPostingFormShow:=TfrmENActPostingFormShow.Create(Application,fmNormal);
   try
      with frmENActPostingFormShow do
        if ShowModal = mrOk then
        begin
            try
               if ENActPostingKindItemObj.ENActPostingForm = nil then ENActPostingKindItemObj.ENActPostingForm := ENActPostingForm.Create();
               ENActPostingKindItemObj.ENActPostingForm.code := StrToInt(GetReturnValue(sgENActPostingForm,0));
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