
unit EditRQContact;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQContactController ;

type
  TfrmRQContactEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblValue : TLabel;
    edtValue: TEdit;
    edtDateLostActuality: TDateTimePicker;


  HTTPRIORQContact: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblType: TLabel;
    edtType: TEdit;
    spbType: TSpeedButton;
    HTTPRIORQContactType: THTTPRIO;
    chbDateLostActuality: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypeClick(Sender: TObject);
    procedure chbDateLostActualityClick(Sender: TObject);
  
  
  private
	procedure onLostActualityChanged;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQContactEdit: TfrmRQContactEdit;
  RQContactObj: RQContact;

implementation

uses ShowRQContactType, RQContactTypeController, Generics.Collections;

{$R *.dfm}

procedure TfrmRQContactEdit.onLostActualityChanged;
begin
	if chbDateLostActuality.Checked then begin
		HideControls([edtDateLostActuality], false);
	end else begin
		HideControls([edtDateLostActuality]);
	end;
end;

procedure TfrmRQContactEdit.FormShow(Sender: TObject);
var TempRQContactType : RQContactTypeControllerSoapPort;
contactType : RQContactType;
begin

  DisableControls([edtCode, edtType]);

  if DialogState = dsView then
  begin
     DisableControls([spbType]);
  end;

  if (DialogState = dsInsert) then begin
    HideControls([edtDateLostActuality, chbDateLostActuality]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue, edtType
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQContactObj.code);
      edtValue.Text := RQContactObj.value;
      SetDateFieldForDateTimePicker(edtDateLostActuality, RQContactObj.dateLostActuality);
      TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;
	    contactType := TempRQContactType.getObject(RQContactObj.typeRef.code);
	    edtType.Text := contactType.name;
      if RQContactObj.dateLostActuality <> nil then begin
		    chbDateLostActuality.Checked := True;
            onLostActualityChanged;
	    end else begin
        onLostActualityChanged;
		    if DialogState = dsView then begin
			    HideControls([chbDateLostActuality]);
			  end;
      end;
  end;
end;

procedure TfrmRQContactEdit.chbDateLostActualityClick(Sender: TObject);
begin
  inherited;
  onLostActualityChanged;
end;

procedure TfrmRQContactEdit.spbTypeClick(Sender: TObject);
begin
  inherited;
  TfrmRQContactTypeShow.chooseFromList(procedure(selectedObj : RQContactTypeShort)
  begin
			  if not Assigned(RQContactObj) then begin
          RQContactObj := RQContact.Create;
         SetNullXSProps(RQContactObj);
          SetNullIntProps(RQContactObj);
			  end;
			  RQContactObj.typeRef := RQContactTypeRef.Create;
			  RQContactObj.typeRef.code := selectedObj.code;
			  edtType.Text := selectedObj.name;
  end);
end;

procedure TfrmRQContactEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQContact: RQContactControllerSoapPort;
listCntrls : TList<TWinControl>;
begin
  listCntrls := TList<TWinControl>.Create;
  listCntrls.AddRange([edtValue, edtType]);
  if chbDateLostActuality.Checked then begin
    listCntrls.Add(edtDateLostActuality);
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(listCntrls.ToArray())  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQContact := HTTPRIORQContact as RQContactControllerSoapPort;


     RQContactObj.value := edtValue.Text; 
	 
	 if chbDateLostActuality.Checked then begin
		RQContactObj.dateLostActuality := GetTXSDateFromTDateTimePicker(edtdateLostActuality);
	 end else begin
		RQContactObj.dateLostActuality := nil;
	 end;

    if DialogState = dsInsert then
    begin
      RQContactObj.code:=low(Integer);
      TempRQContact.add(RQContactObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQContact.save(RQContactObj);
    end;
  end;
end;


end.