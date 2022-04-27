
unit EditRQSpravDKPPItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQSpravDKPPItemController ;

type
  TfrmRQSpravDKPPItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblName : TLabel;
    edtName: TMemo;


  HTTPRIORQSpravDKPPItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbSpravdkppitem: TSpeedButton;
    Label1: TLabel;
    EdtSpravDKPP: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbSpravdkppitemClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQSpravDKPPItemEdit: TfrmRQSpravDKPPItemEdit;
  RQSpravDKPPItemObj: RQSpravDKPPItem;

implementation

uses ShowRQSpravDKPP, RQSpravDKPPController;


{uses  
    EnergyproController, EnergyproController2, RQSpravDKPPItemController  ;
}
{$R *.dfm}



procedure TfrmRQSpravDKPPItemEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode ,EdtSpravDKPP]);
  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtName
       , EdtSpravDKPP
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQSpravDKPPItemObj.code);
    edtNumberGen.Text := RQSpravDKPPItemObj.numberGen;
    MakeMultiline(edtName.Lines, RQSpravDKPPItemObj.name);
    EdtSpravDKPP.Text := RQSpravDKPPItemObj.spravDKPPRef.name;

  end;
end;



procedure TfrmRQSpravDKPPItemEdit.spbSpravdkppitemClick(Sender: TObject);
var
   frmrqspravdkppShow : TfrmRQSpravDKPPShow;
begin


   frmrqspravdkppShow := TfrmRQSpravDKPPShow.Create(Application, fmNormal);
   try
     with frmrqspravdkppShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           if RQSpravDKPPItemObj.spravDKPPRef = nil then
           RQSpravDKPPItemObj.spravDKPPRef := RQSpravDKPPRef.Create;
           RQSpravDKPPItemObj.spravDKPPRef.code := StrToInt( GetReturnValue(sgRQSpravDKPP, 0));
           EdtSpravDKPP.Text := GetReturnValue(sgRQSpravDKPP, 1) ;
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqspravdkppShow.Free;
   end;
end;

procedure TfrmRQSpravDKPPItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtName
      , EdtSpravDKPP
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQSpravDKPPItem := HTTPRIORQSpravDKPPItem as RQSpravDKPPItemControllerSoapPort;


     RQSpravDKPPItemObj.numberGen := edtNumberGen.Text;

     RQSpravDKPPItemObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQSpravDKPPItemObj.code:=low(Integer);
      TempRQSpravDKPPItem.add(RQSpravDKPPItemObj);

     end
    else
    if DialogState = dsEdit then
    begin
      TempRQSpravDKPPItem.save(RQSpravDKPPItemObj);

    end;
  end;
end;


end.