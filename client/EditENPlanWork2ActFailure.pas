
unit EditENPlanWork2ActFailure;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWork2ActFailureController ,
  ENActFailureController;

type
  TfrmENPlanWork2ActFailureEdit = class(TDialogForm)

  lblCode : TLabel;
  edtCode : TEdit;


  HTTPRIOENPlanWork2ActFailure: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  lblNumberGen: TLabel;
  edtNumberGen: TEdit;
  lblDateAct: TLabel;
  edtDateAct: TDateTimePicker;
  lblCommentGen: TLabel;
  edtCommentGen: TMemo;
  spbActFailureReason: TSpeedButton;
  edtENActFailureReason: TEdit;
  lblActFailureReason: TLabel;
  edtActFailureCode: TEdit;
  lblActFailureCode: TLabel;
  HTTPRIOENActFailureReason: THTTPRIO;
  HTTPRIOENActFailure: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbActFailureReasonClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    		planCode : Integer;

end;

var
  frmENPlanWork2ActFailureEdit: TfrmENPlanWork2ActFailureEdit;
  ENPlanWork2ActFailureObj: ENPlanWork2ActFailure;
  ENActFailureObj : ENActFailure;

implementation

uses ShowENActFailureReason, ENActFailureReasonController, DMReportsUnit,
  ENConsts, ENPlanWorkController;


{uses  
    EnergyproController, EnergyproController2, ENPlanWork2ActFailureController  ;
}
{$R *.dfm}



procedure TfrmENPlanWork2ActFailureEdit.FormShow(Sender: TObject);

var TempENActFailureReason :  ENActFailureReasonControllerSoapPort;
    TempENActFailure : ENActFailureControllerSoapPort;

begin
  DisableControls([edtCode, edtActFailureCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, lblActFailureCode, edtCode, edtActFailureCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumberGen, edtDateAct, edtENActFailureReason]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPlanWork2ActFailureObj.code);

      TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;

      ENActFailureObj := TempENActFailure.getObject(ENPlanWork2ActFailureObj.actFailureRef.code);

      edtActFailureCode.Text := IntToStr(ENActFailureObj.code);
      edtNumberGen.Text := ENActFailureObj.numberGen;

      if ENActFailureObj.dateAct <> nil then
      begin
        edtDateAct.DateTime:=EncodeDate(ENActFailureObj.dateAct.Year,ENActFailureObj.dateAct.Month,ENActFailureObj.dateAct.Day);
        edtDateAct.checked := true;
      end
      else
      begin
        edtDateAct.DateTime:=SysUtils.Date;
        edtDateAct.checked := false;
      end;

    MakeMultiline(edtCommentGen.Lines, ENActFailureObj.commentGen);

      if ENActFailureObj.reasonRef <> nil then
       if ENActFailureObj.reasonRef.code <> LOW_INT then
       begin
          TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;
          edtENActFailureReason.Text := TempENActFailureReason.getObject(ENActFailureObj.reasonRef.code).name;
       end;

  end;
end;



procedure TfrmENPlanWork2ActFailureEdit.spbActFailureReasonClick(
  Sender: TObject);
var
   frmENActFailureReasonShow: TfrmENActFailureReasonShow;
begin

   frmENActFailureReasonShow:= TfrmENActFailureReasonShow.Create(Application,fmNormal);
   try
      with frmENActFailureReasonShow do begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENActFailureObj = nil then ENActFailureObj := ENActFailure.Create();

               if ENActFailureObj.reasonRef = nil then
                  ENActFailureObj.reasonRef := ENActFailureReasonRef.Create();

               ENActFailureObj.reasonRef.code := StrToInt(GetReturnValue(sgENActFailureReason, 0));
               edtENActFailureReason.Text:= GetReturnValue(sgENActFailureReason, 1);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENActFailureReasonShow.Free;
   end;

end;

procedure TfrmENPlanWork2ActFailureEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([ edtNumberGen,  edtDateAct, edtENActFailureReason
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanWork2ActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;


     ENActFailureObj.numberGen := edtNumberGen.Text;

     if edtdateAct.checked then
     begin
       if ENActFailureObj.dateAct = nil then
          ENActFailureObj.dateAct := TXSDateTime.Create;
       ENActFailureObj.dateAct.XSToNative(GetXSDate(edtdateAct.DateTime));
     end
     else
       ENActFailureObj.dateAct := nil;

     ENActFailureObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENPlanWork2ActFailureObj.planRef := ENPlanWorkRef.Create();
      ENPlanWork2ActFailureObj.planRef.code := planCode;
      ENPlanWork2ActFailureObj.code:=low(Integer);
      TempENPlanWork2ActFailure.add(ENPlanWork2ActFailureObj, ENActFailureObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWork2ActFailure.save(ENPlanWork2ActFailureObj, ENActFailureObj);
    end;
  end;
end;


end.