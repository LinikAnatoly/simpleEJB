unit reportRestsByOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls,  ChildFormUnit, ENConsts,
     EnergyproController , DMReportsUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmReportRestsByOrder = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    btnAdd: TButton;
    btnDelete: TButton;
    HTTPRIORQOrder: THTTPRIO;
    sgOrderCodes: TAdvStringGrid;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    budgCode: Integer;
    budgName: String;
    orderCodes : String;
    orderName : String;
    orderCodesList : TStringList;

  end;

var
  frmReportRestsByOrder: TfrmReportRestsByOrder;

implementation

uses ENDepartmentController, ShowENDepartment, ENDepartmentTypeController,
  ShowRQOrder, RQOrderController, RQOrderKindController;

{$R *.dfm}


procedure TfrmReportRestsByOrder.btnAddClick(Sender: TObject);
var
    orderCodeI : Integer;
    orderName, orderCode : string;
    frmRQOrderShow: TfrmRQOrderShow;
    f : RQOrderFilter;
begin
  inherited;

  f := RQOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.kindRef := RQOrderKindRef.Create;
  f.kindRef.code := Low(Integer);

  frmRQOrderShow :=TfrmRQOrderShow.Create(Application,fmNormal, f);

  try

    with frmRQOrderShow do
    if ShowModal = mrOk then
    begin
      try

         orderCode := sgRQOrder.Cells[0,sgRQOrder.Row];
         orderName := sgRQOrder.Cells[1,sgRQOrder.Row] + ' | ' + sgRQOrder.Cells[2,sgRQOrder.Row] + ' | ' + sgRQOrder.Cells[3,sgRQOrder.Row];

      try
        orderCodeI := StrToInt(orderCode);
      except
        on EConvertError do begin
           raise Exception.Create('Некоректне значення коду : ' + orderCode);
      end;
      end;

      if(orderCodesList = nil) then orderCodesList := TStringList.Create;

      if( orderCodesList.IndexOf(orderName) = -1) then
        orderCodesList.Add(orderName)
      else begin
        Application.MessageBox(PChar('Заявка: ' + orderName + ' вже введенна'),
                               PChar('Увага'), MB_ICONWARNING+MB_OK);
        Exit;
      end;

      if orderCodesList.Count > 1 then sgOrderCodes.RowCount := sgOrderCodes.RowCount + 1;

      sgOrderCodes.Rows[sgOrderCodes.RowCount - 1].Add('');
      sgOrderCodes.Cells[0, sgOrderCodes.RowCount - 1] := orderCode;
      sgOrderCodes.Cells[1, sgOrderCodes.RowCount - 1] := orderName;
      sgOrderCodes.AddCheckBox(1, sgOrderCodes.RowCount - 1, true, false);

      sgOrderCodes.SetFocus;
      sgOrderCodes.Row := sgOrderCodes.RowCount - 1;

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmRQOrderShow.Free;
  end;
end;

procedure TfrmReportRestsByOrder.btnDeleteClick(Sender: TObject);
var
  state_, isSel : Boolean;
  i, z, index, itemCode : Integer;
  idStringList : TList;
begin
  inherited;

  state_ := false;
  isSel := false;

  for i := 1 to sgOrderCodes.RowCount - 1 do
  begin
     sgOrderCodes.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Оберить хоча б одну заявку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  idStringList := TList.Create;

  for i:= 1 to sgOrderCodes.RowCount - 1 do
  begin
     sgOrderCodes.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
          if(orderCodesList.IndexOf(sgOrderCodes.Cells[1,i]) <> -1) then
          begin
              index := orderCodesList.IndexOf(sgOrderCodes.Cells[1,i]);
              idStringList.Add(Ptr(i));
              orderCodesList.Delete(index);
          end;
     end;

  end;
  z := idStringList.Count - 1;
  while(z >= 0) do
  begin
       itemCode := Integer(idStringList[z]);
       if (sgOrderCodes.RowCount > 2) then
       begin
        sgOrderCodes.RemoveRows(itemCode, 1);
       end
       else
       begin
        sgOrderCodes.Cells[0, itemCode] := '';
        sgOrderCodes.Cells[1, itemCode] := '';
        sgOrderCodes.RemoveCheckBox(1, itemCode);
       end;
       z := z - 1;
  end;

end;

procedure TfrmReportRestsByOrder.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
    i, n : integer;
  state_, isSel : Boolean;

begin

  orderCodes := '';

  n := 0;

  for i:=1 to sgOrderCodes.RowCount - 1 do
  begin
    sgOrderCodes.GetCheckBoxState(1,i,state_);
    if state_ then
    begin
      isSel := True;

       if orderCodes <> '' then
          orderCodes :=  orderCodes + ', '  + sgOrderCodes.Cells[0, i]
          else
          orderCodes := sgOrderCodes.Cells[0, i];

         n := n + 1;

    end;
  end;

  if (n = 0) then
  begin
    Application.MessageBox(PChar('Жодна заявка не вибрана!!!'), PChar('Увага!'),MB_ICONWARNING);
    Exit;
  end;


      SetLength(argNames, 2);
      SetLength(args, 2);

      argNames[0] := 'pOrderCode';
      args[0] := orderCodes;

      argNames[1] := 'pBudgetCode';
      args[1] := IntToStr(budgCode);

      reportName := 'material/rests_by_order/rests_by_order';

      makeReport(reportName, argNames, args, 'xls');

      self.Close;
end;



procedure TfrmReportRestsByOrder.FormCreate(Sender: TObject);
begin
  inherited;
  orderCodes := '';
  budgCode := 0;
end;

procedure TfrmReportRestsByOrder.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '0';
  edtENBudgetName.Text := '';
end;

procedure TfrmReportRestsByOrder.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

end.
