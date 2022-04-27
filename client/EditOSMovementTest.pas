unit EditOSMovementTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient, ComCtrls;

type
  TfrmOSMovementTestEdit = class(TDialogForm)
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    spbOSSelect: TSpeedButton;
    gbMOLOut: TGroupBox;
    lblMolCode: TLabel;
    spbPlanMOL: TSpeedButton;
    lblMolName: TLabel;
    lblENDepartmentDepartmentName: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    edtMolOutCode: TEdit;
    edtMolOutName: TEdit;
    edtENDepartmentDepartmentName: TEdit;
    lblBuhName: TLabel;
    edtBuhName: TEdit;
    HTTPRIORQFKOrder: THTTPRIO;
    btnMove: TButton;
    lblNumberDoc: TLabel;
    edtNumberDoc: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    procedure spbOSSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    kod_podr: String;
  public
    { Public declarations }
  end;

var
  frmOSMovementTestEdit: TfrmOSMovementTestEdit;

implementation

uses ShowOStable, OSTableController, ShowOSMol, OSMolController,
  ShowOSPodr, OSPodrController, ChildFormUnit, RQFKOrderController, XSBuiltIns;

{$R *.dfm}

procedure TfrmOSMovementTestEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;
begin
  f := OStableFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  //f.conditionSQL := ' OSTABLE.KOD_VID in (1, 2, 3, 11, 13, 15, 24, 38) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

  //if length(edtInvNumber.Text) > 0 then
  //  f.kod_inv := '*' + edtInvNumber.Text + '*';

  f.orderBySQL :=  'OSTABLE.STR_NAME';

  frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
  //frmOSTableShow.SendType := 444; /// для энерго ....
  try
    with frmOSTableShow do
      if ShowModal = mrOk then
      begin
        try
          //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
          edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
          edtBuhName.Text := GetReturnValue(sgOSTable,1);
          //DisableControls([edtInvNumber, edtBuhName]);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmOSTableShow.Free;
  end;
end;


procedure TfrmOSMovementTestEdit.FormShow(Sender: TObject);
begin
  inherited;

  DisableControls([edtInvNumber, edtBuhName, edtMolOutCode, edtMolOutName,
                   edtENDepartmentDepartmentName]);
end;

procedure TfrmOSMovementTestEdit.spbPlanMOLClick(Sender: TObject);
var
  fOS: OSMolFilter;
  frmOSMolShow: TfrmOSMolShow;
begin
   fOS := OSMolFilter.Create;
   SetNullXSProps(fOS);
   SetNullIntProps(fOS);

     frmOSMolShow := TfrmOSMolShow.Create(Application, fmNormal, fOS);

     try

        with frmOSMolShow do
        begin
          DisableActions([ actEdit, actInsert ]);
          if ShowModal = mrOk then
          begin
              try

                 //RQFKOrderObj.molOutCode := GetReturnValue(sgOSMol,0);
                 //RQFKOrderObj.molOutName := GetReturnValue(sgOSMol,2);

                 edtMolOutName.Text := GetReturnValue(sgOSMol,2); //RQFKOrderObj.molOutName;  //GetReturnValue(sgFINMol,0);
                 edtMolOutCode.Text := GetReturnValue(sgOSMol,0); //RQFKOrderObj.molOutCode;

                 ///// 23.07.12 NET-801
                 // При изменении кода МОЛа очищаем подразделение, т.к. его номер должен соответствовать коду МОЛа
                 // (или наоборот)
                 // RQFKOrderObj.kod_podr := '';
                 // RQFKOrderObj.name_podr := '';
                 /////
                 edtENDepartmentDepartmentName.Text := '';
                 kod_podr := '';
              except
                 on EConvertError do Exit;
              end;
          end;
        end;
     finally
        frmOSMolShow.Free;
     end;
end;

procedure TfrmOSMovementTestEdit.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmOSPodrShow: TfrmOSPodrShow;
   podrFilter: OSPodrFilter;
   strMolOutPodr: String;
begin
  if edtMolOutCode.Text = '' then
  begin
    Application.MessageBox(PChar('Спочатку оберіть МВО-одержувача!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // Фильтруем подразделение по первым двум цифрам МОЛа
  //strMolOutPodr := Copy(RQFKOrderObj.molOutCode, 1, 2);
  strMolOutPodr := Copy(edtMolOutCode.Text, 1, 2);
  podrFilter := OSPodrFilter.Create;
  SetNullIntProps(podrFilter);
  SetNullXSProps(podrFilter);
  podrFilter.conditionSQL := 'substr(kod_podr, 2, 2) = ''' + strMolOutPodr + '''';

  frmOSPodrShow := TfrmOSPodrShow.Create(Application, fmNormal, podrFilter);
  try
    frmOSPodrShow.DisableActions([frmOSPodrShow.actFilter, frmOSPodrShow.actNoFilter]);
    with frmOSPodrShow do
    begin
      if ShowModal = mrOk then
      begin
        //RQFKOrderObj.kod_podr := GetReturnValue(sgOSPodr, 1);
        //RQFKOrderObj.name_podr := GetReturnValue(sgOSPodr, 2);
        kod_podr := GetReturnValue(sgOSPodr, 1);
        edtENDepartmentDepartmentName.Text := GetReturnValue(sgOSPodr, 1) + ' ' +
                                              GetReturnValue(sgOSPodr, 2); //RQFKOrderObj.kod_podr + ' ' + RQFKOrderObj.name_podr;
      end;
    end;
  finally
    frmOSPodrShow.Free;
  end;
end;

procedure TfrmOSMovementTestEdit.btnMoveClick(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    dateGen: TXSDate;
begin
  if (not NoBlankValues([edtInvNumber, edtNumberDoc, edtDateGen, edtMolOutCode, edtENDepartmentDepartmentName])) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING);
    Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if edtDateGen.Checked then
  begin
    dateGen := TXSDate.Create;
    dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));
  end
  else
    dateGen := nil;

  {TempRQFKOrder.moveOSMovementToFK(edtInvNumber.Text,
                                   edtMolOutCode.Text,
                                   kod_podr,
                                   edtNumberDoc.Text,
                                   dateGen,
                                   edtCommentGen.Text);}
end;

procedure TfrmOSMovementTestEdit.FormCreate(Sender: TObject);
begin
  inherited;
  kod_podr := '';
end;

end.
