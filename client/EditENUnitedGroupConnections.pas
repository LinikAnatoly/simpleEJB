
unit EditENUnitedGroupConnections;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts, DMReportsUnit,
	  EnergyproController, EnergyproController2, ENUnitedGroupConnectionsController,
    ExtCtrls, ENUnitedGroup2TechCondServicesController;

type
  TfrmENUnitedGroupConnectionsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENUnitedGroupConnections: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    ImageList1: TImageList;
    HTTPRIOENUnitedGroup2TechCondServices: THTTPRIO;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    pnUnitedGroup: TPanel;
    sgENUnitedGroup2TechCondServices: TAdvStringGrid;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure actInsertExecute(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    substation04Code : Integer;
    groupCode : Integer;
    tcsCode : Integer;
    { Public declarations }

end;

var
  frmENUnitedGroupConnectionsEdit : TfrmENUnitedGroupConnectionsEdit;
  ENUnitedGroupConnectionsObj : ENUnitedGroupConnections;
  ENUnitedGroup2TechCondServicesObj : ENUnitedGroup2TechCondServices;


implementation


{uses
    EnergyproController, EnergyproController2, ENUnitedGroupConnectionsController  ;
}


uses
  ENServicesObjectController, ENServicesContractTypeController, ENServicesContractKindController,
  ShowENServicesCalculation, ENTechConditionsServicesController;

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENUnitedGroup2TechCondServicesHeaders: array [1..23] of String =
        ( 'Код'
          ,'Замовник'
          ,'№ дог. фін.кол.'
          ,'Потужність, кВ'
          ,'інв. № лінії 0,4 кВ'
          ,'Назва лінії 0,4 кВ'
          ,'Влін (індивідуальна), тис. грн.'
          ,'Влін (ділянка 1), тис. грн.'
          ,'Влін (ділянка 2), тис. грн.'
          ,'Влін (ділянка 3), тис. грн.'
          ,'інв. № ТП 10/0,4 кВ'
          ,'Назва ТП 10/0,4 кВ'
          ,'інв. № лінії 6-10 кВ'
          ,'Назва лінії 6-10 кВ'
          ,'Влін (індивідуальна), тис. грн.'
          ,'Влін (ділянка 1), тис. грн.'
          ,'Влін (ділянка 2), тис. грн.'
          ,'Влін (ділянка 3), тис. грн.'
          ,'Влін (ділянка 4), тис. грн.'
          ,'інв. № ПС 35 кВ'
          ,'Назва ПС 35 кВ'
          ,'№ групи'
          ,'Вартість приєднання, тис. грн.'
        );

        
{$R *.dfm}


procedure TfrmENUnitedGroupConnectionsEdit.FormShow(Sender: TObject);
var
  TempENUnitedGroup2TechCondServices : ENUnitedGroup2TechCondServicesControllerSoapPort;
  i : Integer;
  ENUnitedGroup2TechCondServicesList : ENUnitedGroup2TechCondServicesShortList;
  groupFilter : ENUnitedGroup2TechCondServicesFilter;
begin
  SetGridHeaders(ENUnitedGroup2TechCondServicesHeaders, sgENUnitedGroup2TechCondServices.ColumnHeaders);
  ColCount:=100;
  TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;

  groupFilter := ENUnitedGroup2TechCondServicesFilter.Create;
  SetNullIntProps(groupFilter);
  SetNullXSProps(groupFilter);

  if (tcsCode <> LOW_INT) then
  begin
    groupFilter.techCondServRef := ENTechConditionsServicesRef.Create;
    groupFilter.techCondServRef.code := tcsCode;
  end;
  
  ENUnitedGroup2TechCondServicesList := TempENUnitedGroup2TechCondServices.getScrollableFilteredList(groupFilter,0,ColCount);

  LastCount:=High(ENUnitedGroup2TechCondServicesList.list);

  if LastCount > -1 then
     sgENUnitedGroup2TechCondServices.RowCount:=LastCount+2
  else
     sgENUnitedGroup2TechCondServices.RowCount:=2;

   with sgENUnitedGroup2TechCondServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENUnitedGroup2TechCondServicesList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENUnitedGroup2TechCondServicesList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENUnitedGroup2TechCondServicesList.list[i].techCondServRefPartnerName;
        CellProperties[1, i+1].ReadOnly := True;
        Colors[1, i+1] := clInactiveCaption;
        Cells[2,i+1] := ENUnitedGroup2TechCondServicesList.list[i].techCondServRefContractNumber;
        CellProperties[2, i+1].ReadOnly := True;
        Colors[2, i+1] := clInactiveCaption;

        if ENUnitedGroup2TechCondServicesList.list[i].techCondServRefTyServicesPower = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENUnitedGroup2TechCondServicesList.list[i].techCondServRefTyServicesPower.DecimalString;
        CellProperties[3, i+1].ReadOnly := True;
        Colors[3, i+1] := clInactiveCaption;

        Cells[4,i+1] := ENUnitedGroup2TechCondServicesList.list[i].line04InvNumber;
        CellProperties[4, i+1].ReadOnly := True;
        Colors[4, i+1] := clYellow;
        Cells[5,i+1] := ENUnitedGroup2TechCondServicesList.list[i].line04Name;
        CellProperties[5, i+1].ReadOnly := True;
        Colors[5, i+1] := clYellow;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines04Building = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines04Building.DecimalString;
        Colors[6, i+1] := clYellow;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines04Building1 = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines04Building1.DecimalString;
        Colors[7, i+1] := clYellow;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines04Building2 = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines04Building2.DecimalString;
        Colors[8, i+1] := clYellow;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines04Building3 = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines04Building3.DecimalString;
        Colors[9, i+1] := clYellow;  

        Cells[10,i+1] := ENUnitedGroup2TechCondServicesList.list[i].tp04InvNumber;
        CellProperties[10, i+1].ReadOnly := True;
        Colors[10, i+1] := clGreen;
        Cells[11,i+1] := ENUnitedGroup2TechCondServicesList.list[i].tp04Name;
        CellProperties[11, i+1].ReadOnly := True;
        Colors[11, i+1] := clGreen;

        Cells[12,i+1] := ENUnitedGroup2TechCondServicesList.list[i].line10invnumber;
        CellProperties[12, i+1].ReadOnly := True;
        Colors[12, i+1] := clCream;
        Cells[13,i+1] := ENUnitedGroup2TechCondServicesList.list[i].line10Name;
        CellProperties[13, i+1].ReadOnly := True;
        Colors[13, i+1] := clCream;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines10Building = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines10Building.DecimalString;
        Colors[14, i+1] := clCream;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines10Building1 = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines10Building1.DecimalString;
        Colors[15, i+1] := clCream;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines10Building2 = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines10Building2.DecimalString;
        Colors[16, i+1] := clCream;

        if ENUnitedGroup2TechCondServicesList.list[i].costLines10Building3 = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines10Building3.DecimalString;
        Colors[17, i+1] := clCream;  

        if ENUnitedGroup2TechCondServicesList.list[i].costLines10Building4 = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENUnitedGroup2TechCondServicesList.list[i].costLines10Building4.DecimalString;
        Colors[18, i+1] := clCream;

        Cells[19,i+1] := ENUnitedGroup2TechCondServicesList.list[i].pc35InvNumber;
        CellProperties[19, i+1].ReadOnly := True;
        Colors[19, i+1] := clRed;
        Cells[20,i+1] := ENUnitedGroup2TechCondServicesList.list[i].pc35Name;
        CellProperties[20, i+1].ReadOnly := True;
        Colors[20, i+1] := clRed;


        if ENUnitedGroup2TechCondServicesList.list[i].paySum = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := ENUnitedGroup2TechCondServicesList.list[i].paySum.DecimalString;
        CellProperties[22, i+1].ReadOnly := True;
        Colors[22, i+1] := clCream;

        LastRow:=i+1;
        sgENUnitedGroup2TechCondServices.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENUnitedGroup2TechCondServices.Row:=1;


  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([ ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    //edtCode.Text := IntToStr(ENUnitedGroupConnectionsObj.code);
    //edtName.Text := ENUnitedGroupConnectionsObj.name;
  end;
  
end;



procedure TfrmENUnitedGroupConnectionsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  i, count : Integer;
  TempENUnitedGroup2TechCondServices : ENUnitedGroup2TechCondServicesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;
    
     //ENUnitedGroupConnectionsObj.name := edtName.Text;

    if DialogState = dsInsert then
    begin
      //ENUnitedGroupConnectionsObj.code:=low(Integer);
      //TempENUnitedGroupConnections.add(ENUnitedGroupConnectionsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      //TempENUnitedGroupConnections.save(ENUnitedGroupConnectionsObj);


      if Application.MessageBox(PChar('Вы действительно хотите сохранить данные по договору?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin

        if sgENUnitedGroup2TechCondServices.Cells[6,i+1] = '' then
           ENUnitedGroup2TechCondServicesObj.costLines04Building := nil
        else begin
          ENUnitedGroup2TechCondServicesObj.costLines04Building := TXSDecimal.Create;
          ENUnitedGroup2TechCondServicesObj.costLines04Building.DecimalString := sgENUnitedGroup2TechCondServices.Cells[6,i+1];
        end;

        if sgENUnitedGroup2TechCondServices.Cells[14,i+1] = '' then
           ENUnitedGroup2TechCondServicesObj.costLines10Building := nil
        else begin
          ENUnitedGroup2TechCondServicesObj.costLines10Building := TXSDecimal.Create;
          ENUnitedGroup2TechCondServicesObj.costLines10Building.DecimalString := sgENUnitedGroup2TechCondServices.Cells[14,i+1];
        end;

        TempENUnitedGroup2TechCondServices.save(ENUnitedGroup2TechCondServicesObj);
      end;

    end;
  end;
end;


procedure TfrmENUnitedGroupConnectionsEdit.actInsertExecute(Sender: TObject);
var
  soCode, tcsCode, utcsCode : Integer;
  f : ENServicesObjectFilter;
  frmENServicesConnectionShow : TfrmENServicesCalculationShow;
  TempENUnitedGroup2TechCondServices : ENUnitedGroup2TechCondServicesControllerSoapPort;
begin
  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.contractTypeRef := ENServicesContractTypeRef.Create;
  f.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;
  f.contractKindRef := ENServicesContractKindRef.Create;
  f.contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

  f.conditionSQL := ' ENSERVICESOBJECT.code in ' +
                    '( ' +
                    ' select so2tc.servicesobjectrefcode ' +
                    '   from enservicesobject2techcondtnsservices so2tc, ' +
                    '        entechconditionsservcs tc ' +
                    '  where so2tc.techcondservrefcode = tc.code ' +
                    '   and tc.s04refcode = ' + IntToStr(substation04Code) +
                    '   and tc.connectionkindrefcode = ' + IntToStr(ENCONNECTIONKIND_NO_STANDART) +
                    ') ';

  frmENServicesConnectionShow := TfrmENServicesCalculationShow.Create(Application, fmNormal, f);

  try
    frmENServicesConnectionShow.notStandartConnection := True;
    frmENServicesConnectionShow.substation04Code := substation04Code;
    frmENServicesConnectionShow.Caption := 'Приєднання (нова Методика)';
    frmENServicesConnectionShow.UpdateCaption;
    {
    with frmENServicesConnectionShow do begin
      if ShowModal = mrOk then
      begin
        try
          soCode := StrToInt(GetReturnValue(sgENServicesObject,0));

          if (groupCode = LOW_INT) then
          if (ENUnitedGroup2TechCondServicesObj <> nil) and (ENUnitedGroup2TechCondServicesObj.unitedGroupRef <> nil)
                 and (ENUnitedGroup2TechCondServicesObj.unitedGroupRef.code <> LOW_INT) then
          begin
            groupCode := ENUnitedGroup2TechCondServicesObj.unitedGroupRef.code;
            ENUnitedGroup2TechCondServicesObj := nil;
          end else
            groupCode := LOW_INT;


          if ENUnitedGroup2TechCondServicesObj = nil then ENUnitedGroup2TechCondServicesObj := ENUnitedGroup2TechCondServices.Create;
          if ENUnitedGroup2TechCondServicesObj.techCondServRef = nil then
              ENUnitedGroup2TechCondServicesObj.techCondServRef := ENTechConditionsServicesRef.Create;

          tcsCode := DMReports.getTechCondServicesCodeByServicesCode(soCode);
          ENUnitedGroup2TechCondServicesObj.techCondServRef.code := tcsCode;

          if ENUnitedGroup2TechCondServicesObj.unitedGroupRef = nil then
             ENUnitedGroup2TechCondServicesObj.unitedGroupRef := ENUnitedGroupConnectionsRef.Create;
          ENUnitedGroup2TechCondServicesObj.unitedGroupRef.code := groupCode;

          TempENUnitedGroup2TechCondServices := HTTPRIOENUnitedGroup2TechCondServices as ENUnitedGroup2TechCondServicesControllerSoapPort;
          utcsCode := TempENUnitedGroup2TechCondServices.add(ENUnitedGroup2TechCondServicesObj);

          groupCode := TempENUnitedGroup2TechCondServices.getObject(utcsCode).unitedGroupRef.code;

        except
          on EConvertError do Exit;
        end;
      end;
    end;
    }
  finally
    frmENServicesConnectionShow.Free;
  end;

  FormShow(Sender);
end;


procedure TfrmENUnitedGroupConnectionsEdit.FormCreate(Sender: TObject);
begin
  inherited;
  groupCode := LOW_INT;
  tcsCode := LOW_INT;
end;

end.
